import { Request } from '@hapi/hapi';
import { injectable } from 'inversify';
import { plainToInstance } from 'class-transformer';
import { Logger } from 'tslog';
import { DateTime } from 'luxon';

import { IWeatherForecastService } from '$app/interfaces';
import {
  WeatherForecastResponseDto,
  WeatherForecastAvgTemperatureResponseDto,
  WeatherForecastRequestDto
} from '$app/dto';
import { CityEntity, CityStatEntity, WeatherForecastEntity } from '$core/entites';


@injectable()
export class WeatherForecastService implements IWeatherForecastService {
  private readonly logger = new Logger({
    name: WeatherForecastService.name
  });

  async getAvgTemperature (request: Request): Promise<WeatherForecastAvgTemperatureResponseDto> {
    try {
      const { cityId } = request.params;
      const dataSource = request.dataSource();
      const weatherForecastRepository = dataSource.getRepository(WeatherForecastEntity);
      const cityRepository = dataSource.getRepository(CityEntity);

      const city = await cityRepository.findOneByOrFail({ id: cityId });

      const avgEntity = await weatherForecastRepository.createQueryBuilder('weatherForecast')
        .leftJoinAndSelect('weatherForecast.timestamps', 'timestamps')
        .leftJoinAndSelect('timestamps.weatherSummary', 'weatherSummary')
        .where('weatherForecast.cityId = :cityId', { cityId: city.id })
        .select('AVG(weatherSummary.temperature)', 'avgTemp')
        .getRawOne();


      return plainToInstance(WeatherForecastAvgTemperatureResponseDto, avgEntity, { excludeExtraneousValues: true });
    } catch (error) {
      this.logger.error(error);
      throw error;
    }
  }

  async getWeatherForecast (request: Request): Promise<WeatherForecastResponseDto> {
    try {
      const { cityId, date } = <WeatherForecastRequestDto> request.query;
      const dataSource = request.dataSource();
      const cityRepository = dataSource.getRepository(CityEntity);
      const cityStatRepository = dataSource.getRepository(CityStatEntity);
      const weatherForecastRepository = dataSource.getRepository(WeatherForecastEntity);

      const city = await cityRepository.findOneByOrFail({ id: cityId });

      const weatherForecast = await weatherForecastRepository.findOne({
        where: {
          cityId: city.id,
          date: DateTime.fromJSDate(date).startOf('day').toJSDate(),
        },
        relations: ['city', 'timestamps', 'timestamps.weatherSummary', 'timestamps.weatherDescription', 'timestamps.weatherWind']
      });

      await cityStatRepository.increment({ id: city.id }, 'numberOfView', 1);

      return plainToInstance(WeatherForecastResponseDto, weatherForecast, { excludeExtraneousValues: true });
    } catch (error) {
      this.logger.error(error);
      throw error;
    }
  }

}

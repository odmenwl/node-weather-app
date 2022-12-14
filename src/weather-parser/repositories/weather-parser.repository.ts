import dataSource from '$db/data-source';
import {
  CityEntity,
  WeatherDescriptionEntity,
  WeatherForecastEntity,
  WeatherSummaryEntity,
  WeatherTimestampEntity,
  WeatherWindEntity
} from '$core/entites';
import { ICity, IWeatherForecast } from '$core/intefaces';


export class WeatherParserRepository {
  async saveWeatherForecast (weatherForecasts: IWeatherForecast[]): Promise<void> {
    const queryRunner = dataSource.createQueryRunner();
    await queryRunner.connect();

    const weatherForecastRepository = queryRunner.manager.getRepository(WeatherForecastEntity);
    const weatherTimestampRepository = queryRunner.manager.getRepository(WeatherTimestampEntity);
    const weatherSummaryRepository = queryRunner.manager.getRepository(WeatherSummaryEntity);
    const weatherWindRepository = queryRunner.manager.getRepository(WeatherWindEntity);
    const weatherDescriptionRepository = queryRunner.manager.getRepository(WeatherDescriptionEntity);

    await queryRunner.startTransaction();

    try {
      for (const weatherForecast of weatherForecasts) {
        const weatherForecastEntity = await weatherForecastRepository.save({
          sunrise: weatherForecast.sunrise,
          sunset: weatherForecast.sunset,
          cityId: weatherForecast.cityId,
          date: weatherForecast.date,
        });

        for (const timestamp of weatherForecast.timestamps) {
          const weatherWindEntity = await weatherWindRepository.save({
            degrees: timestamp.weatherWind?.degrees,
            gust: timestamp.weatherWind?.gust,
            speed: timestamp.weatherWind?.speed
          });

          const weatherSummaryEntity = await weatherSummaryRepository.save({
            humidity: timestamp.weatherSummary?.humidity,
            pressure: timestamp.weatherSummary?.pressure,
            temperature: timestamp.weatherSummary?.temperature,
            temperatureMax: timestamp.weatherSummary?.temperatureMax,
            temperatureMin: timestamp.weatherSummary?.temperatureMin,
            temperatureFeelsLike: timestamp.weatherSummary?.temperatureFeelsLike,
          });

          const weatherDescriptionEntity = await weatherDescriptionRepository.save({
            text: timestamp.weatherDescription?.text,
            type: timestamp.weatherDescription?.type,
          });

          await weatherTimestampRepository.save({
            cloudiness: timestamp.cloudiness,
            weatherWindId: weatherWindEntity.id,
            weatherSummaryId: weatherSummaryEntity.id,
            weatherDescriptionId: weatherDescriptionEntity.id,
            weatherForecastId: weatherForecastEntity.id,
            timestamp: timestamp.timestamp,
          });
        }
      }
      await queryRunner.commitTransaction();
    } catch (err) {
      await queryRunner.rollbackTransaction();
      throw err;
    } finally {
      await queryRunner.release();
    }
  }

  async getCities (): Promise<ICity[]> {
    const cityRepository = dataSource.getRepository(CityEntity);
    return cityRepository.find();
  }
}

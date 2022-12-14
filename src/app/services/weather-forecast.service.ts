import { injectable } from 'inversify';

import { IWeatherForecastService } from '$app/interfaces';
import { WeatherForecastResponseDto, WeatherForecastAvgTemperatureResponseDto } from '$app/dto';


@injectable()
export class WeatherForecastService implements IWeatherForecastService {
  async getAvgTemperature (): Promise<WeatherForecastAvgTemperatureResponseDto> {
    return { avgTemp: 0 };
  }

  async getWeatherForecast (): Promise<WeatherForecastResponseDto> {
    return {};
  }

}

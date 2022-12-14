import { Request } from '@hapi/hapi';

import { WeatherForecastAvgTemperatureResponseDto, WeatherForecastResponseDto } from '$app/dto';


export interface IWeatherForecastService {
  getWeatherForecast(request: Request): Promise<WeatherForecastResponseDto>;
  getAvgTemperature(request: Request): Promise<WeatherForecastAvgTemperatureResponseDto>;
}

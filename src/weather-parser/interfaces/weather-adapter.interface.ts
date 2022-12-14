import { ICity, IWeatherForecast } from '$core/intefaces';
import { WeatherDataSourceEnum } from '$core/enums';


export interface IWeatherAdapter {
  weatherSource: WeatherDataSourceEnum;
  getWeatherForecast(cities: ICity[]): Promise<IWeatherForecast[]>;
}

import { IWeatherAdapter } from './interfaces';

import { ICity, IWeatherForecast } from '$core/intefaces';


export class WeatherParserAdapter {
  constructor (private readonly adaptee: IWeatherAdapter) {}

  getWeatherForecast (cities: ICity[]): Promise<IWeatherForecast[]> {
    return this.adaptee.getWeatherForecast(cities);
  }
}

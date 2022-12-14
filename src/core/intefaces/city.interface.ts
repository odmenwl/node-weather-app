import { ICountry } from './country.interface';
import { ICityStat } from './city-stat.interface';
import { IBaseEntity } from './base.interface';
import { IWeatherForecast } from './weather-forecast.interface';


export interface ICity extends IBaseEntity {
  name: string;
  latitude: number;
  longitude: number;
  countryId: number;
  cityStatId: number;

  country?: ICountry;
  cityStat?: ICityStat;
  weatherForecasts?: IWeatherForecast[];
}

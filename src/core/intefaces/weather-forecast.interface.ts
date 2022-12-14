import { ICity } from './city.interface';
import { IBaseEntity } from './base.interface';
import { IWeatherTimestamp } from './weather-timestamp.interface';

import { WeatherDataSourceEnum } from '$core/enums';


export interface IWeatherForecast extends IBaseEntity {
  sunrise: number;
  sunset: number;
  dayTimestamp: number;
  description: string | null;
  weatherDataSource: WeatherDataSourceEnum;
  cityId: number;

  city?: ICity;
  timestamps: IWeatherTimestamp[];
}

import { IBaseEntity } from './base.interface';


export interface IWeatherSummary extends IBaseEntity {
  temperature: number;
  temperatureFeelsLike: number;
  temperatureMax: number;
  temperatureMin: number;
  humidity: number;
  pressure: number;
}

import { IBaseEntity } from './base.interface';
import { IWeatherForecast } from './weather-forecast.interface';
import { IWeatherSummary } from './weather-summary.interface';
import { IWeatherDescription } from './weather-description.inteface';
import { IWeatherWind } from './weather-wind.interface';


export interface IWeatherTimestamp extends IBaseEntity {
  weatherSummaryId: number;
  weatherDescriptionId: number;
  weatherWindId: number;
  cloudiness: number;
  timestamp: number;
  weatherForecastId: number;

  weatherForecast?: IWeatherForecast;
  weatherSummary?: IWeatherSummary;
  weatherDescription?: IWeatherDescription;
  weatherWind?: IWeatherWind;
}

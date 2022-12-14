import { IBaseEntity } from '$core/intefaces/base.interface';


export interface IWeatherWind extends IBaseEntity {
  speed: number;
  degrees: number;
  gust: number;
}

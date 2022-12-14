import { IBaseEntity } from '$core/intefaces/base.interface';


export interface IWeatherDescription extends IBaseEntity {
  text: string | null;
  type: string;
}

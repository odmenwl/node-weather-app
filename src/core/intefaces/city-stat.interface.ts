import { IBaseEntity } from './base.interface';

import { ICity } from '$core/intefaces/city.interface';


export interface ICityStat extends IBaseEntity {
  numberOfView: number;
  city?: ICity;
}

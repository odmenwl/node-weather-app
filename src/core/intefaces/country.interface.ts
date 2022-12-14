import { IBaseEntity } from './base.interface';


export interface ICountry extends IBaseEntity {
  name: string;
  code: string;
}

import { PrimaryGeneratedColumn } from 'typeorm';

import { IBaseEntity } from '$core/intefaces/base.interface';


export abstract class BaseEntity implements IBaseEntity {
  @PrimaryGeneratedColumn()
  id: number;
}

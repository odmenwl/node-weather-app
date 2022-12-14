import { Column, Entity, JoinColumn, OneToOne } from 'typeorm';

import { ICityStat } from '../intefaces';

import { BaseEntity } from './base.entity';

import { CityEntity } from '$core/entites/city.entity';


@Entity('CityStats')
export class CityStatEntity extends BaseEntity implements ICityStat {
  @Column({
    default: 0,
  })
  numberOfView: number;

  @OneToOne(() => CityEntity, {
    createForeignKeyConstraints: false,
  })
  @JoinColumn({
    name: 'id',
    referencedColumnName: 'cityStatId'
  })
  city: CityEntity;
}

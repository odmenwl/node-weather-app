import { Column, Entity } from 'typeorm';

import { BaseEntity } from './base.entity';

import { IWeatherWind } from '$core/intefaces';


@Entity('WeatherWinds')
export class WeatherWindEntity extends BaseEntity implements IWeatherWind {
  @Column({
    type: 'float'
  })
  degrees: number;

  @Column({
    type: 'float'
  })
  gust: number;

  @Column({
    type: 'float'
  })
  speed: number;
}

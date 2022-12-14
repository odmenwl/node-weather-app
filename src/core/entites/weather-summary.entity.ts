import { Column, Entity } from 'typeorm';

import { BaseEntity } from './base.entity';

import { IWeatherSummary } from '$core/intefaces';


@Entity('WeatherSummaries')
export class WeatherSummaryEntity extends BaseEntity implements IWeatherSummary {
  @Column({
    type: 'float'
  })
  humidity: number;

  @Column({
    type: 'float'
  })
  pressure: number;

  @Column({
    type: 'float'
  })
  temperature: number;

  @Column({
    type: 'float'
  })
  temperatureFeelsLike: number;

  @Column({
    type: 'float'
  })
  temperatureMax: number;

  @Column({
    type: 'float'
  })
  temperatureMin: number;
}

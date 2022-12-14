import { Column, Entity } from 'typeorm';

import { BaseEntity } from './base.entity';

import { IWeatherDescription } from '$core/intefaces';


@Entity('WeatherDescriptions')
export class WeatherDescriptionEntity extends BaseEntity implements IWeatherDescription {
  @Column({
    type: 'text',
    nullable: true
  })
  text: string | null;

  @Column()
  type: string;
}

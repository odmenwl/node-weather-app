import { Column, Entity, ManyToOne, OneToOne, JoinColumn, OneToMany } from 'typeorm';

import { ICity } from '../intefaces';

import { BaseEntity } from './base.entity';
import { CityStatEntity } from './city-stat.entity';
import { CountryEntity } from './country.entity';

import { WeatherForecastEntity } from '$core/entites/weather-forecast.entity';


@Entity('Cities')
export class CityEntity extends BaseEntity implements ICity {
  @Column()
  name: string;

  @Column({
    type: 'double precision'
  })
  latitude: number;

  @Column({
    type: 'double precision'
  })
  longitude: number;

  @Column()
  countryId: number;

  @Column()
  cityStatId: number;

  @OneToOne(() => CityStatEntity)
  @JoinColumn({ name: 'cityStatId' })
  cityStat: CityStatEntity;

  @ManyToOne(() => CountryEntity, (country) => country.cities)
  country: CountryEntity;

  @OneToMany(() => WeatherForecastEntity, (w) => w.city)
  weatherForecasts: WeatherForecastEntity[];
}

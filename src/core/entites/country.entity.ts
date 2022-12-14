import { Column, Entity, OneToMany } from 'typeorm';

import { ICountry } from '../intefaces';

import { BaseEntity } from './base.entity';
import { CityEntity } from './city.entity';


@Entity('Countries')
export class CountryEntity extends BaseEntity implements ICountry {
  @Column()
  name: string;

  @Column({
    unique: true,
    length: 10,
  })
  code: string;

  @OneToMany(() => CityEntity, (city) => city.country)
  cities: CityEntity[];
}

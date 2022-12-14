import { Column, Entity, ManyToOne, OneToMany } from 'typeorm';

import { BaseEntity } from './base.entity';
import { CityEntity } from './city.entity';
import { WeatherTimestampEntity } from './weather-timestamp.entity';

import { IWeatherForecast } from '$core/intefaces';
import { WeatherDataSourceEnum } from '$core/enums';



@Entity('WeatherForecasts')
export class WeatherForecastEntity extends BaseEntity implements IWeatherForecast {
  @Column()
  cityId: number;

  @Column()
  dayTimestamp: number;

  @Column({
    type: 'text',
    nullable: true,
  })
  description: string | null;

  @Column()
  sunrise: number;

  @Column()
  sunset: number;

  @Column({
    type: 'enum',
    enumName: 'WeatherDataSourceEnum',
    enum: WeatherDataSourceEnum,
    default: WeatherDataSourceEnum.OPEN_WEATHER_MAP,
  })
  weatherDataSource: WeatherDataSourceEnum;

  @ManyToOne(() => CityEntity, (city) => city.weatherForecasts)
  city: CityEntity;

  @OneToMany(() => WeatherTimestampEntity, (w) => w.weatherForecast)
  timestamps: WeatherTimestampEntity[];
}

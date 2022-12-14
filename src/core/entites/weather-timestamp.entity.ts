import { Column, Entity, ManyToOne, OneToOne, Unique } from 'typeorm';

import { BaseEntity } from './base.entity';
import { WeatherForecastEntity } from './weather-forecast.entity';
import { WeatherSummaryEntity } from './weather-summary.entity';
import { WeatherWindEntity } from './weather-wind.entity';
import { WeatherDescriptionEntity } from './weather-description.entity';

import { IWeatherTimestamp } from '$core/intefaces';


@Entity('WeatherTimestamps')
@Unique('WeatherTimestamps_timestamp_weatherForecastId_constraint', ['timestamp', 'weatherForecastId'])
export class WeatherTimestampEntity extends BaseEntity implements IWeatherTimestamp {
  @Column({
    type: 'float'
  })
  cloudiness: number;

  @Column()
  timestamp: number;

  @Column()
  weatherDescriptionId: number;

  @Column()
  weatherSummaryId: number;

  @Column()
  weatherWindId: number;

  @Column()
  weatherForecastId: number;

  @OneToOne(() => WeatherSummaryEntity)
  weatherSummary: WeatherSummaryEntity;

  @OneToOne(() => WeatherDescriptionEntity)
  weatherDescription: WeatherDescriptionEntity;

  @OneToOne(() => WeatherWindEntity)
  weatherWind: WeatherWindEntity;

  @ManyToOne(() => WeatherForecastEntity, (w) => w.timestamps)
  weatherForecast: WeatherForecastEntity;
}

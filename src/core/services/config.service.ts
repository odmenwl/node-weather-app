import { join } from 'node:path';

import { ServerOptions } from '@hapi/hapi';
import { DataSourceOptions } from 'typeorm/data-source/DataSourceOptions';

import {
  CityEntity, CityStatEntity, CountryEntity, WeatherWindEntity,
  WeatherTimestampEntity, WeatherDescriptionEntity, WeatherSummaryEntity, WeatherForecastEntity
} from '../entites';


export class ConfigService {
  public static get (key: string): string {
    if (!(key in process.env)) {
      throw new Error(`Environment variable ${key} is undefined`);
    }

    return <string> process.env[key];
  }

  public static getNumber (key: string): number {
    return Number(this.get(key));
  }

  public static serverOptions (): ServerOptions {
    return {
      port: this.getNumber('APP_PORT'),
      host: this.get('APP_HOST'),
    };
  }

  public static dbOptions (): DataSourceOptions {
    return {
      type: 'postgres',
      host: this.get('DB_HOST'),
      port: this.getNumber('DB_PORT'),
      username: this.get('DB_USER'),
      password: this.get('DB_PASSWORD'),
      database: this.get('DB_DATABASE'),
      entities: [
        CityEntity, CityStatEntity, CountryEntity, WeatherWindEntity,
        WeatherTimestampEntity, WeatherDescriptionEntity, WeatherSummaryEntity, WeatherForecastEntity
      ],
      migrations: [join('src', 'db', 'migrations', '*.ts')]
    };
  }
}

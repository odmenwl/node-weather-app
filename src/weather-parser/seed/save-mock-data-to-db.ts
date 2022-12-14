import { promises } from 'node:fs';
import { join } from 'node:path';

import { WeatherParserRepository } from '../repositories';

import dataSource from '$db/data-source';


const saveMockDataToDb = async () => {
  await dataSource.initialize();
  const repository = new WeatherParserRepository();

  const json = await promises.readFile(join('src', 'weather-parser', 'seed', 'weather-data.json'), 'utf-8');

  const weatherForecasts = JSON.parse(json);

  await repository.saveWeatherForecast(weatherForecasts);
};

saveMockDataToDb();

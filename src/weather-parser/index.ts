import { WeatherParserRepository } from './repositories';
import { WeatherParserAdapter } from './weather-parser.adapter';
import { OpenWeatherAdaptee } from './adaptees';
import { OpenWeatherApi } from './apis/open-weather/open-weahter.api';

import dataSource from '$db/data-source';


const getWeatherData = async () => {
  await dataSource.initialize();
  const openWeatherApi = new OpenWeatherApi();
  const adaptee = new OpenWeatherAdaptee(openWeatherApi);
  const service = new WeatherParserAdapter(adaptee);
  const repository = new WeatherParserRepository();

  const cities = await repository.getCities();

  const weatherForecasts = await service.getWeatherForecast(cities);

  await repository.saveWeatherForecast(weatherForecasts);
};


getWeatherData();

import { ServerRoute } from '@hapi/hapi';

import { appDIContainer, TYPES } from '$app/container';
import { IWeatherForecastService } from '$app/interfaces';


export const weatherForecastRoutes: ServerRoute[] = [
  {
    method: 'GET',
    path: '/weather-forecasts/',
    options: {
      tags: ['api', 'weather-forecasts'],
      handler: (request) =>
        appDIContainer.get<IWeatherForecastService>(TYPES.WEATHER_FORECAST_SERVICE).getWeatherForecast(request)
    }
  },
  {
    method: 'GET',
    path: '/weather-forecasts/${cityId}/avg-temp',
    options: {
      tags: ['api', 'weather-forecasts'],
      handler: (request) =>
        appDIContainer.get<IWeatherForecastService>(TYPES.WEATHER_FORECAST_SERVICE).getAvgTemperature(request)
    }
  }
];

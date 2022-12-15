import { ServerRoute } from '@hapi/hapi';
import Joi from 'joi';

import { appDIContainer, TYPES } from '$app/container';
import { IWeatherForecastService } from '$app/interfaces';
import { WeatherForecastRequestDto } from '$app/dto';


export const weatherForecastRoutes: ServerRoute[] = [
  {
    method: 'GET',
    path: '/weather-forecasts/',
    options: {
      tags: ['api', 'weather-forecasts'],
      handler: (request) =>
        appDIContainer.get<IWeatherForecastService>(TYPES.WEATHER_FORECAST_SERVICE).getWeatherForecast(request),
      validate: {
        query: Joi.object<WeatherForecastRequestDto>({
          cityId: Joi.number().required(),
          date: Joi.date().default(new Date()),
        })
      }
    }
  },
  {
    method: 'GET',
    path: '/weather-forecasts/{cityId}/avg-temp',
    options: {
      tags: ['api', 'weather-forecasts'],
      handler: (request) =>
        appDIContainer.get<IWeatherForecastService>(TYPES.WEATHER_FORECAST_SERVICE).getAvgTemperature(request),
      validate: {
        params: Joi.object({
          cityId: Joi.number().required()
        }),
      }
    }
  }
];

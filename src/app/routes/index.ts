import { ServerRoute } from '@hapi/hapi';

import { cityRoutes } from './city.routes';
import { cityStatRoutes } from './city-stat.routes';
import { weatherForecastRoutes } from './weather-forecast.routes';


export const routes: ServerRoute[] = [
  ...cityRoutes,
  ...cityStatRoutes,
  ...weatherForecastRoutes,
];

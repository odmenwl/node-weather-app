import { Container } from 'inversify';

import { CityService, CityStatService, WeatherForecastService } from '$app/services';
import { ICityService, ICityStatService, IWeatherForecastService } from '$app/interfaces';


export const TYPES = {
  CITY_SERVICE: Symbol('CITY_SERVICE'),
  CITY_STAT_SERVICE: Symbol('CITY_STAT_SERVICE'),
  WEATHER_FORECAST_SERVICE: Symbol('WEATHER_FORECAST_SERVICE')
};

const appDIContainer = new Container();
appDIContainer.bind<ICityService>(TYPES.CITY_SERVICE).to(CityService);
appDIContainer.bind<ICityStatService>(TYPES.CITY_STAT_SERVICE).to(CityStatService);
appDIContainer.bind<IWeatherForecastService>(TYPES.WEATHER_FORECAST_SERVICE).to(WeatherForecastService);

export {
  appDIContainer,
};

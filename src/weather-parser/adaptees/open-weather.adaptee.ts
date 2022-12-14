import { IWeatherAdapter } from '../interfaces';
import { OpenWeatherApi } from '../apis/open-weather/open-weahter.api';

import { ICity, IWeatherForecast } from '$core/intefaces';
import { WeatherDataSourceEnum } from '$core/enums';


export class OpenWeatherAdaptee implements IWeatherAdapter {
  weatherSource: WeatherDataSourceEnum = WeatherDataSourceEnum.OPEN_WEATHER_MAP;

  constructor (
    public readonly openWeatherApi: OpenWeatherApi,
  ) {}

  async getWeatherForecast (cities: ICity[]): Promise<IWeatherForecast[]> {
    return Promise.all(
      cities.map(async (city) => {
        const response = await this.openWeatherApi.fiveDayForecast({
          lat: city.latitude,
          lon: city.longitude,
        });


        const timestamps = response.list.map((l) => {
          return {
            cloudiness: l.clouds.all,
            timestamp: l.dt,
            weatherWind: {
              degrees: l.wind.deg,
              speed: l.wind.speed,
              gust: l.wind.gust,
            },
            weatherDescription: {
              text: l.weather[0].description,
              type: l.weather[0].main,
            },
            weatherSummary: {
              humidity: l.main.humidity,
              pressure: l.main.pressure,
              temperature: l.main.temp,
              temperatureMax: l.main.temp_max,
              temperatureMin: l.main.temp_min,
              temperatureFeelsLike: l.main.feels_like,
            },
          };
        });

        return <IWeatherForecast> {
          weatherDataSource: this.weatherSource,
          cityId: city.id,
          sunset: response.city.sunset,
          sunrise: response.city.sunrise,
          timestamps,
          dayTimestamp: 0,
        };

      })
    );
  }

}

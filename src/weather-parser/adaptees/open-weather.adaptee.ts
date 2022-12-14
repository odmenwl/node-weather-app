import { DateTime } from 'luxon';
import { flatten, groupBy } from 'lodash';

import { IWeatherAdapter } from '../interfaces';
import { OpenWeatherApi } from '../apis/open-weather/open-weahter.api';

import { ICity, IWeatherForecast, IWeatherTimestamp } from '$core/intefaces';
import { WeatherDataSourceEnum } from '$core/enums';


export class OpenWeatherAdaptee implements IWeatherAdapter {
  weatherSource: WeatherDataSourceEnum = WeatherDataSourceEnum.OPEN_WEATHER_MAP;

  constructor (
    public readonly openWeatherApi: OpenWeatherApi,
  ) {}

  async getWeatherForecast (cities: ICity[]): Promise<IWeatherForecast[]> {
    const weatherForecasts = await Promise.all(
      cities.map(async (city) => {
        const response = await this.openWeatherApi.fiveDayForecast({
          lat: city.latitude,
          lon: city.longitude,
        });


        const groupedByDay = groupBy(response.list,
          (l) => DateTime.fromSeconds(l.dt).startOf('day')
        );

        const weatherForecasts: IWeatherForecast[] = [];

        for (const [date, lists] of Object.entries(groupedByDay)) {

          const timestamps: Partial<IWeatherTimestamp>[] = [];

          for (const listItem of lists) {
            timestamps.push({
              cloudiness: listItem.clouds.all,
              timestamp: listItem.dt,
              weatherWind: {
                degrees: listItem.wind.deg,
                speed: listItem.wind.speed,
                gust: listItem.wind.gust,
              },
              weatherDescription: {
                text: listItem.weather[0].description,
                type: listItem.weather[0].main,
              },
              weatherSummary: {
                humidity: listItem.main.humidity,
                pressure: listItem.main.pressure,
                temperature: listItem.main.temp,
                temperatureMax: listItem.main.temp_max,
                temperatureMin: listItem.main.temp_min,
                temperatureFeelsLike: listItem.main.feels_like,
              },
            });
          }

          weatherForecasts.push({
            weatherDataSource: this.weatherSource,
            cityId: city.id,
            sunset: response.city.sunset,
            sunrise: response.city.sunrise,
            timestamps,
            date: DateTime.fromISO(date).startOf('day').toUTC().toJSDate(),
          } as IWeatherForecast);
        }


        return weatherForecasts;

      })
    );

    return flatten(weatherForecasts);
  }

}

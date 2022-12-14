import axios, { isAxiosError } from 'axios';
import { Logger } from 'tslog';

import { IOpenWeatherFiveDayForecastRequest, IOpenWeatherFiveDayForecastResponse } from './interfaces';

import { ConfigService } from '$core/services';



export class OpenWeatherApi {
  private readonly logger = new Logger({
    name: OpenWeatherApi.name,
  });

  private readonly baseUrl = 'https://api.openweathermap.org/data/2.5';

  private readonly appid;

  constructor () {
    this.appid = ConfigService.get('OPEN_WEATHER_KEY');
  }

  async fiveDayForecast ({ lat, lon }: IOpenWeatherFiveDayForecastRequest): Promise<IOpenWeatherFiveDayForecastResponse> {
    const url = `${this.baseUrl}/forecast`;

    const uri = axios.getUri({
      url,
      method: 'GET',
      params: <IOpenWeatherFiveDayForecastRequest> {
        lat,
        lon,
        appId: this.appid,
      }
    });

    let data: IOpenWeatherFiveDayForecastResponse;
    try {
      this.logger.debug(uri);

      const response = await axios.get(uri);
      this.logger.debug(response.data);
      data = response.data;
    } catch (error) {
      if (isAxiosError(error)) {
        this.logger.error('error message: ', error?.response?.data);
        throw error;
      } else {
        this.logger.error('unexpected error: ', error);
        throw error;
      }
    }

    return data;
  }
}

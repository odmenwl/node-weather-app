import { Expose, Type } from 'class-transformer';


class CityDto {
  @Expose()
  name: string;
}

class WeatherSummaryDto {
  @Expose()
  humidity: number;

  @Expose()
  pressure: number;

  @Expose()
  temperature: number;

  @Expose()
  temperatureFeelsLike: number;

  @Expose()
  temperatureMax: number;

  @Expose()
  temperatureMin: number;
}

class WeatherDescriptionDto {
  @Expose()
  text: string | null;

  @Expose()
  type: string;
}

class WeatherWindDto {
  @Expose()
  degrees: number;

  @Expose()
  gust: number;

  @Expose()
  speed: number;
}

class TimestampDto {
  @Expose()
  cloudiness: number;

  @Expose()
  timestamp: number;

  @Expose()
  weatherDescriptionId: number;

  @Expose()
  weatherSummaryId: number;

  @Expose()
  weatherWindId: number;

  @Expose()
  weatherForecastId: number;

  @Expose()
  @Type(() => WeatherSummaryDto)
  weatherSummary: WeatherSummaryDto;

  @Expose()
  @Type(() => WeatherDescriptionDto)
  weatherDescription: WeatherDescriptionDto;

  @Expose()
  @Type(() => WeatherWindDto)
  weatherWind: WeatherWindDto;
}

export class WeatherForecastResponseDto {
  @Expose()
  id: number;

  @Expose()
  cityId: number;

  @Expose()
  @Type(() => Date)
  date: Date;

  @Expose()
  sunrise: number;

  @Expose()
  sunset: number;

  @Expose()
  @Type(() => TimestampDto)
  timestamps: TimestampDto[];

  @Expose()
  @Type(() => CityDto)
  city: CityDto;
}

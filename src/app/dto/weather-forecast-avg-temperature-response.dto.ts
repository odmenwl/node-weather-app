import { Expose } from 'class-transformer';


export class WeatherForecastAvgTemperatureResponseDto {
  @Expose()
  avgTemp: number;
}

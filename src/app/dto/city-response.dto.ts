import { Expose, Type } from 'class-transformer';


class CountryResponseDto {
  @Expose()
  name: string;

  @Expose()
  code: string;
}

export class CityResponseDto {
  @Expose()
  id: number;

  @Expose()
  name: string;

  @Expose()
  latitude: number;

  @Expose()
  longitude: number;

  @Expose()
  @Type(() => CountryResponseDto)
  country: CountryResponseDto;
}

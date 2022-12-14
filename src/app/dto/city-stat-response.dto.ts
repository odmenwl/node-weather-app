import { Expose, Type } from 'class-transformer';


class CityDto {
  @Expose()
  id: number;

  @Expose()
  name: string;
}

export class CityStatResponseDto {
  @Expose()
  id: number;

  @Expose()
  numberOfView: number;

  @Type(() => CityDto)
  @Expose()
  city: CityDto;
}

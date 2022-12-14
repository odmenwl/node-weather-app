import { Expose, Type } from 'class-transformer';


class StatResponseDto {
  @Expose()
  numberOfView: number;
}

export class CityPopularResponseDto {
  @Expose()
  id: number;

  @Expose()
  name: string;

  @Expose()
  @Type(() => StatResponseDto)
  cityStat: StatResponseDto;
}

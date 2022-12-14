import { Request } from '@hapi/hapi';

import { CityResponseDto, CityPopularResponseDto } from '$app/dto';


export interface ICityService {
  getList(request: Request): Promise<CityResponseDto[]>;
  getPopular (request: Request): Promise<CityPopularResponseDto>;
}

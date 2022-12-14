import { Request } from '@hapi/hapi';

import { CityStatResponseDto } from '$app/dto';


export interface ICityStatService {
  getList (request: Request): Promise<CityStatResponseDto[]>;
}

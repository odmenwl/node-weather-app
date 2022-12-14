import { Request } from '@hapi/hapi';
import { Logger } from 'tslog';
import { injectable } from 'inversify';
import { plainToInstance } from 'class-transformer';

import { CityEntity } from '$core/entites';
import { ICityService } from '$app/interfaces';
import { CityResponseDto, CityPopularResponseDto } from '$app/dto';


@injectable()
export class CityService implements ICityService {
  private readonly logger = new Logger({
    name: CityService.name
  });

  async getList (request: Request): Promise<CityResponseDto[]> {
    try {
      const dataSource = request.dataSource();
      const cityRepository = dataSource.getRepository(CityEntity);
      const cityEntities = await cityRepository.find({
        relations: ['country'],
      });

      return plainToInstance(CityResponseDto, cityEntities, { excludeExtraneousValues: true });
    } catch (error) {
      this.logger.error(error);
      throw error;
    }
  }


  async getPopular (request: Request): Promise<CityPopularResponseDto> {
    try {
      const dataSource = request.dataSource();
      const cityRepository = dataSource.getRepository(CityEntity);
      const popCities = await cityRepository.find({
        relations: ['cityStat'],
        take: 1,
        order: {
          cityStat: {
            numberOfView: 'desc',
          }
        }
      });

      const popCity = popCities[0];

      return plainToInstance(CityPopularResponseDto, popCity, { excludeExtraneousValues: true });
    } catch (error) {
      this.logger.error(error);
      throw error;
    }
  }
}

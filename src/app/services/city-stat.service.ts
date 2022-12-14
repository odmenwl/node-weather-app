import { Request } from '@hapi/hapi';
import { injectable } from 'inversify';
import { Logger } from 'tslog';
import { plainToInstance } from 'class-transformer';

import { ICityStatService } from '$app/interfaces';
import { CityStatResponseDto } from '$app/dto';
import { CityStatEntity } from '$core/entites';


@injectable()
export class CityStatService implements ICityStatService {
  private readonly logger = new Logger({
    name: CityStatService.name
  });

  async getList (request: Request): Promise<CityStatResponseDto[]> {
    try {
      const dataSource = request.dataSource();
      const cityStatRepository = dataSource.getRepository(CityStatEntity);
      const cityStatEntities = await cityStatRepository.find({
        relations: ['city']
      });

      return plainToInstance(CityStatResponseDto, cityStatEntities, { excludeExtraneousValues: true });
    } catch (error) {
      this.logger.error(error);
      throw error;
    }
  }

}

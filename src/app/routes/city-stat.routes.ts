import { ServerRoute } from '@hapi/hapi';

import { appDIContainer, TYPES } from '$app/container';
import { ICityStatService } from '$app/interfaces';


export const cityStatRoutes: ServerRoute[] =  [
  {
    method: 'GET',
    path: '/city-stats',
    options: {
      tags: ['api', 'city-stats'],
      handler: (request) => appDIContainer.get<ICityStatService>(TYPES.CITY_STAT_SERVICE).getList(request)
    }
  }
];

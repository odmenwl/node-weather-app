import { ServerRoute } from '@hapi/hapi';

import { appDIContainer, TYPES } from '$app/container';
import { ICityService } from '$app/interfaces';


export const cityRoutes: ServerRoute[] = [
  {
    method: 'GET',
    path: '/cities',
    options: {
      tags: ['api', 'cities'],
      handler: (request) => appDIContainer.get<ICityService>(TYPES.CITY_SERVICE).getList(request)
    }
  },
  {
    method: 'GET',
    path: '/cities/popular',
    options: {
      tags: ['api', 'cities'],
      handler: (request) => appDIContainer.get<ICityService>(TYPES.CITY_SERVICE).getPopular(request)
    }
  }
];

import { DataSource } from 'typeorm';
import { Plugin } from '@hapi/hapi';

import dataSource from '$db/data-source';


declare module '@hapi/hapi' {
  interface Request {
    dataSource: () => DataSource;
  }

  interface PluginProperties {
    'dataSource': {
      dataSource: () => DataSource;
    };
  }
}

export const typeormPlugin = {
  name: 'dataSource',
  register: async (server) => {
    await dataSource.initialize().catch(console.error);
    const getDataSource = () => dataSource;

    server.expose('dataSource', getDataSource);
    server.decorate('request', 'dataSource', getDataSource);
  }
} as Plugin<void>;

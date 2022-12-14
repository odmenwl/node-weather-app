import Inert from '@hapi/inert';
import Vision from '@hapi/vision';
import HapiSwagger from 'hapi-swagger';
import { ServerRegisterPluginObject } from '@hapi/hapi';



const swaggerOptions: HapiSwagger.RegisterOptions = {
  info: {
    title: 'Weather app',
  },
  grouping: 'tags',
  documentationPath: '/docs',
};


export const swaggerPlugins: Array<ServerRegisterPluginObject<any>> = [
  {
    plugin: Inert
  },
  {
    plugin: Vision
  },
  {
    plugin: HapiSwagger,
    options: swaggerOptions
  }
];

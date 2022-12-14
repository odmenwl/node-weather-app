import { Logger } from 'tslog';
import { Server } from '@hapi/hapi';

import { ConfigService } from '$core/services';
import { routes } from '$app/routes';
import { swaggerPlugins, typeormPlugin } from '$app/plugins';


class App {
  private readonly logger = new Logger({
    name: App.name
  });

  private readonly server: Server;

  constructor () {
    this.server = new Server(ConfigService.serverOptions());
  }

  public async setup () {
    await this.setupPlugins();
    await this.setupRoutes();
  }

  public async start () {
    await this.server.start();
    this.logger.info(`'Server running on ${this.server.info.uri}`);
  }

  private setupRoutes () {
    this.server.route(routes);
  }

  private async setupPlugins () {
    await this.server.register(typeormPlugin);
    await this.server.register(swaggerPlugins);
  }
}

const app = new App();

export default app;

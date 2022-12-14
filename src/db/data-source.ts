import 'dotenv/config';
import { DataSource } from 'typeorm';

import { ConfigService } from '$core/services';


const dataSource = new DataSource(ConfigService.dbOptions());

export default dataSource;

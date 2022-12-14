import 'dotenv/config';
import 'reflect-metadata';

import app from './app';


process.on('unhandledRejection', (err) => {
  console.log(err);
  process.exit(1);
});

(async () => {
  await app.setup();
  await app.start();
})();




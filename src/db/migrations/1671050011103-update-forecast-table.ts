import { MigrationInterface, QueryRunner } from 'typeorm';


export class updateForecastTable1671050011103 implements MigrationInterface {
    name = 'updateForecastTable1671050011103';

    public async up (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts"
                RENAME COLUMN "dayTimestamp" TO "date"
        `);
        await queryRunner.query(`
            ALTER TABLE "Cities" DROP CONSTRAINT "FK_32aa93f32441440388dc885dec6"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts" DROP COLUMN "date"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts"
            ADD "date" TIMESTAMP NOT NULL
        `);
        await queryRunner.query(`
            ALTER TABLE "Cities"
            ADD CONSTRAINT "FK_32aa93f32441440388dc885dec6" FOREIGN KEY ("cityStatId") REFERENCES "CityStats"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
        `);
    }

    public async down (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "Cities" DROP CONSTRAINT "FK_32aa93f32441440388dc885dec6"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts" DROP COLUMN "date"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts"
            ADD "date" integer NOT NULL
        `);
        await queryRunner.query(`
            ALTER TABLE "Cities"
            ADD CONSTRAINT "FK_32aa93f32441440388dc885dec6" FOREIGN KEY ("cityStatId") REFERENCES "CityStats"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts"
                RENAME COLUMN "date" TO "dayTimestamp"
        `);
    }

}

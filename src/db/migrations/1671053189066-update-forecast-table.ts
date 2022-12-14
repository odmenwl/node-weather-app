import { MigrationInterface, QueryRunner } from 'typeorm';


export class updateForecastTable1671053189066 implements MigrationInterface {
    name = 'updateForecastTable1671053189066';

    public async up (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "Countries"
            ADD CONSTRAINT "UQ_4071037968b1866139daaafb530" UNIQUE ("code")
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherTimestamps"
            ADD CONSTRAINT "WeatherTimestamps_timestamp_weatherForecastId_constraint" UNIQUE ("timestamp", "weatherForecastId")
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts"
            ADD CONSTRAINT "WeatherForecasts_cityId_date_weatherDataSource_unique_constraint" UNIQUE ("cityId", "date", "weatherDataSource")
        `);
    }

    public async down (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts" DROP CONSTRAINT "WeatherForecasts_cityId_date_weatherDataSource_unique_constraint"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherTimestamps" DROP CONSTRAINT "WeatherTimestamps_timestamp_weatherForecastId_constraint"
        `);
        await queryRunner.query(`
            ALTER TABLE "Countries" DROP CONSTRAINT "UQ_4071037968b1866139daaafb530"
        `);
    }

}

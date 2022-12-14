import { MigrationInterface, QueryRunner } from 'typeorm';


export class weather1671020846343 implements MigrationInterface {
    name = 'weather1671020846343';

    public async up (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            CREATE TABLE "WeatherSummaries" (
                "id" SERIAL NOT NULL,
                "humidity" double precision NOT NULL,
                "pressure" double precision NOT NULL,
                "temperature" double precision NOT NULL,
                "temperatureFeelsLike" double precision NOT NULL,
                "temperatureMax" double precision NOT NULL,
                "temperatureMin" double precision NOT NULL,
                CONSTRAINT "PK_de14db847e89e30cce84c5a4172" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TABLE "WeatherWinds" (
                "id" SERIAL NOT NULL,
                "degrees" double precision NOT NULL,
                "gust" double precision NOT NULL,
                "speed" double precision NOT NULL,
                CONSTRAINT "PK_83f3646b50bcb5f904dc608f290" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TYPE "public"."WeatherTypeEnum" AS ENUM('RAIN', 'SNOW', 'EXTREME')
        `);
        await queryRunner.query(`
            CREATE TABLE "WeatherDescriptions" (
                "id" SERIAL NOT NULL,
                "text" text NOT NULL,
                "type" "public"."WeatherTypeEnum" NOT NULL,
                CONSTRAINT "PK_8b1dd39acaac2dbde91fed9d51a" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TABLE "WeatherTimestamps" (
                "id" SERIAL NOT NULL,
                "cloudiness" double precision NOT NULL,
                "timestamp" integer NOT NULL,
                "weatherDescriptionId" integer NOT NULL,
                "weatherSummaryId" integer NOT NULL,
                "weatherWindId" integer NOT NULL,
                "weatherForecastId" integer NOT NULL,
                CONSTRAINT "PK_a83647a7b26b0c9c67871b707f3" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TYPE "public"."WeatherDataSourceEnum" AS ENUM('OPEN_WEATHER_MAP')
        `);
        await queryRunner.query(`
            CREATE TABLE "WeatherForecasts" (
                "id" SERIAL NOT NULL,
                "cityId" integer NOT NULL,
                "dayTimestamp" integer NOT NULL,
                "description" text,
                "sunrise" integer NOT NULL,
                "sunset" integer NOT NULL,
                "weatherDataSource" "public"."WeatherDataSourceEnum" NOT NULL DEFAULT 'OPEN_WEATHER_MAP',
                CONSTRAINT "PK_d2f50db1d74dea72e62bb631716" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherTimestamps"
            ADD CONSTRAINT "FK_6d5c64029d3bdfbca0e15d943d4" FOREIGN KEY ("weatherForecastId") REFERENCES "WeatherForecasts"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts"
            ADD CONSTRAINT "FK_f36336031910a56be7cf662421e" FOREIGN KEY ("cityId") REFERENCES "Cities"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
        `);
    }

    public async down (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherForecasts" DROP CONSTRAINT "FK_f36336031910a56be7cf662421e"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherTimestamps" DROP CONSTRAINT "FK_6d5c64029d3bdfbca0e15d943d4"
        `);
        await queryRunner.query(`
            DROP TABLE "WeatherForecasts"
        `);
        await queryRunner.query(`
            DROP TYPE "public"."WeatherDataSourceEnum"
        `);
        await queryRunner.query(`
            DROP TABLE "WeatherTimestamps"
        `);
        await queryRunner.query(`
            DROP TABLE "WeatherDescriptions"
        `);
        await queryRunner.query(`
            DROP TYPE "public"."WeatherTypeEnum"
        `);
        await queryRunner.query(`
            DROP TABLE "WeatherWinds"
        `);
        await queryRunner.query(`
            DROP TABLE "WeatherSummaries"
        `);
    }

}

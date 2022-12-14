import { MigrationInterface, QueryRunner } from 'typeorm';


export class weatherEnumm1671021113545 implements MigrationInterface {
    name = 'weatherEnumm1671021113545';

    public async up (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherDescriptions" DROP COLUMN "type"
        `);
        await queryRunner.query(`
            DROP TYPE "public"."WeatherTypeEnum"
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherDescriptions"
            ADD "type" character varying NOT NULL
        `);
    }

    public async down (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherDescriptions" DROP COLUMN "type"
        `);
        await queryRunner.query(`
            CREATE TYPE "public"."WeatherTypeEnum" AS ENUM('RAIN', 'SNOW', 'EXTREME')
        `);
        await queryRunner.query(`
            ALTER TABLE "WeatherDescriptions"
            ADD "type" "public"."WeatherTypeEnum" NOT NULL
        `);
    }

}

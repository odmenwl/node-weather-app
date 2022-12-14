import { MigrationInterface, QueryRunner } from 'typeorm';


export class weatherEnumm1671021258552 implements MigrationInterface {
    name = 'weatherEnumm1671021258552';

    public async up (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherDescriptions"
            ALTER COLUMN "text" DROP NOT NULL
        `);
    }

    public async down (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "WeatherDescriptions"
            ALTER COLUMN "text"
            SET NOT NULL
        `);
    }

}

import { MigrationInterface, QueryRunner } from 'typeorm';


export class cities1670957079509 implements MigrationInterface {
    name = 'cities1670957079509';

    public async up (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            CREATE TABLE "CityStats" (
                "id" SERIAL NOT NULL,
                "numberOfView" integer NOT NULL DEFAULT '0',
                CONSTRAINT "PK_be91b077d692ee31bcd9c4a018f" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TABLE "Countries" (
                "id" SERIAL NOT NULL,
                "name" character varying NOT NULL,
                "code" character varying(10) NOT NULL,
                CONSTRAINT "PK_5f9a9dcfcf9de1ea528e3ff0bb4" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            CREATE TABLE "Cities" (
                "id" SERIAL NOT NULL,
                "name" character varying NOT NULL,
                "latitude" double precision NOT NULL,
                "longitude" double precision NOT NULL,
                "countryId" integer NOT NULL,
                "cityStatId" integer NOT NULL,
                CONSTRAINT "REL_32aa93f32441440388dc885dec" UNIQUE ("cityStatId"),
                CONSTRAINT "PK_21ae4232868104702703893428e" PRIMARY KEY ("id")
            )
        `);
        await queryRunner.query(`
            ALTER TABLE "Cities"
            ADD CONSTRAINT "FK_32aa93f32441440388dc885dec6" FOREIGN KEY ("cityStatId") REFERENCES "CityStats"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
        `);
        await queryRunner.query(`
            ALTER TABLE "Cities"
            ADD CONSTRAINT "FK_aaf3cedcb598c83309f22ffdb6b" FOREIGN KEY ("countryId") REFERENCES "Countries"("id") ON DELETE NO ACTION ON UPDATE NO ACTION
        `);
    }

    public async down (queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`
            ALTER TABLE "Cities" DROP CONSTRAINT "FK_aaf3cedcb598c83309f22ffdb6b"
        `);
        await queryRunner.query(`
            ALTER TABLE "Cities" DROP CONSTRAINT "FK_32aa93f32441440388dc885dec6"
        `);
        await queryRunner.query(`
            DROP TABLE "Cities"
        `);
        await queryRunner.query(`
            DROP TABLE "Countries"
        `);
        await queryRunner.query(`
            DROP TABLE "CityStats"
        `);
    }

}

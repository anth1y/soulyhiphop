PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "bars" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "authors" varchar(255), "entry_url" varchar(255), "description" text, "published_at" datetime, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "hiphop_sites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "url" varchar(255), "image_url" varchar(255), "description" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20141009025842');
INSERT INTO "schema_migrations" VALUES('20140816025629');
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;

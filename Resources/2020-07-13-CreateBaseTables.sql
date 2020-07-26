------------------------------
---- DROP & CREATE TABLES ----
------------------------------

BEGIN;

DROP TABLE IF EXISTS "Place";
CREATE TABLE "Place" (
    "id" UUID NOT NULL,
    "latitude" REAL NOT NULL,
    "longitude" REAL NOT NULL,
    "nameHU" TEXT NOT NULL,
    "nameEN" TEXT NOT NULL,
    "infoHU" TEXT NOT NULL,
    "infoEN" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "priority" INT NOT NULL,
    "status" TEXT NOT NULL,
    "thumbnailUrl" TEXT,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "PlaceImage";
CREATE TABLE "PlaceImage" (
    "id" UUID NOT NULL,
    "placeId" UUID NOT NULL,
    "imageUrl" TEXT NOT NULL,
    FOREIGN KEY ("placeId") REFERENCES "Place"("id")
);

DROP TABLE IF EXISTS "PlaceDataVersion";
CREATE TABLE "PlaceDataVersion" (
    "id" UUID NOT NULL,
    "dataVersion" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "PlaceSuggestion";
CREATE TABLE "PlaceSuggestion" (
    "id" UUID NOT NULL,
    "latitude" REAL NOT NULL,
    "longitude" REAL NOT NULL,
    "name" TEXT NOT NULL,
    "info" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "senderEmail" TEXT NOT NULL,
    "image1" BYTEA NOT NULL,
    "image2" BYTEA NOT NULL,
    "image3" BYTEA,
    "image4" BYTEA,
    "status" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "PlaceReport";
CREATE TABLE "PlaceReport" (
    "id" UUID NOT NULL,
    "senderEmail" TEXT,
    "reportText" TEXT NOT NULL,
    "placeId" TEXT NOT NULL,
    "placeName" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

COMMIT;

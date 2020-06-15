BEGIN;

-- Drop & create tables
DROP TABLE IF EXISTS "Place";
CREATE TABLE "Place" (
	"id" uuid not null,
	"latitude" real not null,
	"longitude" real not null,
	"nameHU" text not null,
    "nameEN" text not null,
	"infoHU" text not null,
    "infoEN" text not null,
	"type" text not null,
	"status" text not null,
	"thumbnailUrl" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "PlaceImage";
CREATE TABLE "PlaceImage" (
    "id" uuid not null,
    "placeId" uuid not null,
    "imageUrl" text not null,
    FOREIGN KEY ("placeId") REFERENCES "Place"("id")
);

DROP TABLE IF EXISTS "PlaceDataVersion";
CREATE TABLE "PlaceDataVersion" (
    "id" uuid not null,
	"dataVersion" timestamp not null,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "PlaceSuggestion";
CREATE TABLE "PlaceSuggestion" (
    "id" uuid not null,
    "latitude" real not null,
    "longitude" real not null,
    "name" text not null,
    "info" text not null,
    "type" text not null,
    "senderEmail" text not null,
    "image1" bytea not null,
    "image2" bytea not null,
    "image3" bytea,
    "image4" bytea,
    "status" text not null,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "PlaceReport";
CREATE TABLE "PlaceReport" (
    "id" uuid not null,
    "senderEmail" text,
    "reportText" text not null,
    "placeId" text not null,
    "placeName" text not null,
    "status" text not null,
    PRIMARY KEY ("id")
);

-- Propagate base data
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('1371AEF5-5782-49C6-B71B-F3D511ABAC90', 47.497912, 19.040235, 'Helicopter', 'Helicopter-en', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.-en', 'skatepark', 'active', 'https://libertyskate.hu/mobile/example/images/Helicopter.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('D16EEC15-DAB4-4E90-86BE-C5884F0C3B34', 47.539016, 19.034754, 'Top of First Run', 'Top of First Run-en', 'Incredible views from up here.', 'Incredible views from up here.-en', 'skatepark', 'active', 'https://libertyskate.hu/mobile/example/images/Crag.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('61BE013D-28BD-40ED-AB4F-D678AACD0B04', 47.420912, 19.090235, 'Nice Tracks', 'Nice Tracks-en', 'Oh no! Clouds rolling in.', 'Oh no! Clouds rolling in.-en', 'skatepark', 'active', NULL);
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('FBC6DB92-9B2B-476E-978E-1F5E5939D262', 47.560912, 19.160235, 'Incoming!', 'Incoming!-en', 'Brace yourself for fierce wind.', 'Brace yourself for fierce wind.-en', 'streetspot', 'active', 'https://libertyskate.hu/mobile/example/images/HelicopterLanding.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('6F64B5D7-4EB6-4BB6-A719-95912101A8E7', 47.380912, 19.044235, 'Valley Floor', 'Valley Floor-en', 'Views are spectacular even from here.', 'Views are spectacular even from here.-en', 'streetspot', 'active', 'https://libertyskate.hu/mobile/example/images/Mountain.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('0FC2EDBA-01CD-4376-81A5-A3FD872BB7EB', 47.450912, 19.320235, 'Ready for Pickup', 'Ready for Pickup-en', 'This isn’t Jenga, stack ‘em neatly.', 'This isn’t Jenga, stack ‘em neatly.-en', 'streetspot', 'active', 'https://libertyskate.hu/mobile/example/images/PileOfSkis.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('62AA30F7-0D61-4006-B417-B9E34A3190DA', 47.607912, 19.120235, 'Flying', 'Flying-en', 'Wouldn’t you love to be at the controls?', 'Wouldn’t you love to be at the controls?-en', 'skateshop', 'active', 'https://libertyskate.hu/mobile/example/images/Cockpit.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('0CF937B2-C509-4677-B109-4B7E1D9E8791', 47.486818, 19.014536, 'Panorama', 'Panorama-en', 'Cool iPhone feature.', 'Cool iPhone feature.-en', 'skateshop', 'active', 'https://libertyskate.hu/mobile/example/images/Panorama.png');
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "status", "thumbnailUrl") VALUES ('8A5549E5-C122-47F8-B446-292A71B68A7A', 47.510258, 19.082678, 'Apres Ski', 'Apres Ski-en', 'In Canada, after all.', 'In Canada, after all.-en', 'skateshop', 'deleted', 'https://libertyskate.hu/mobile/example/images/Curling.png');

INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('61356402-9D64-4167-92C5-39CB8FC18E3C', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/example/images/Helicopter.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('347CB359-0FCD-413A-9EB7-419959834665', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/example/images/Helicopter.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('94885C7E-3745-45C2-978F-628B29618AE4', 'D16EEC15-DAB4-4E90-86BE-C5884F0C3B34', 'https://libertyskate.hu/mobile/example/images/Crag.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('8709A1FD-03DB-48AA-BE1C-76DF8C9C4D33', '61BE013D-28BD-40ED-AB4F-D678AACD0B04', 'https://libertyskate.hu/mobile/example/images/FreshTracks.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('0D4764B6-B62C-47F1-8D49-C5AED4C81913', '61BE013D-28BD-40ED-AB4F-D678AACD0B04', 'https://libertyskate.hu/mobile/example/images/FreshTracks.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('FEE4FFB0-2510-4EF0-9596-CAE18E22F2DE', '6F64B5D7-4EB6-4BB6-A719-95912101A8E7', 'https://libertyskate.hu/mobile/example/images/Mountain.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('41D62EEA-856B-4E90-AA4F-9D5EB751DFC0', '6F64B5D7-4EB6-4BB6-A719-95912101A8E7', 'https://libertyskate.hu/mobile/example/images/Mountain.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('2F1AD337-9DC6-4746-B578-F99BBFB2AAF4', '0FC2EDBA-01CD-4376-81A5-A3FD872BB7EB', 'https://libertyskate.hu/mobile/example/images/PileOfSkis.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F79E8CF5-B354-41F0-BC0D-15FECC600414', '62AA30F7-0D61-4006-B417-B9E34A3190DA', 'https://libertyskate.hu/mobile/example/images/Cockpit.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('C35EE4DF-096E-4E3E-8ED4-B90D9A66CE17', '62AA30F7-0D61-4006-B417-B9E34A3190DA', 'https://libertyskate.hu/mobile/example/images/Cockpit.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('B34EFA8B-BFF4-4F76-8863-0F371CC6BB8D', '0CF937B2-C509-4677-B109-4B7E1D9E8791', 'https://libertyskate.hu/mobile/example/images/Panorama.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('8A7C3AF6-CC37-4156-B240-F71ED3523510', '8A5549E5-C122-47F8-B446-292A71B68A7A', 'https://libertyskate.hu/mobile/example/images/Curling.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('149A5F17-37D8-4F91-B559-6729572604E5', '8A5549E5-C122-47F8-B446-292A71B68A7A', 'https://libertyskate.hu/mobile/example/images/Curling.jpg');

INSERT INTO "PlaceDataVersion" ("id", "dataVersion") VALUES ('4728D8FE-BD81-4961-88F3-E442A795179A', '2019-08-16 02:00:00');

COMMIT;

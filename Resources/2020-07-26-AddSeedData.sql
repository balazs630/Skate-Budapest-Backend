-----------------------------
---- PROPAGATE BASE DATA ----
-----------------------------

BEGIN;

--- Place data version
INSERT INTO "PlaceDataVersion" ("id", "dataVersion") VALUES ('4728D8FE-BD81-4961-88F3-E442A795179A', '2020-07-25 20:00:00');

--- Places and it's images
-- Dunaharaszti skatepark
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('1371AEF5-5782-49C6-B71B-F3D511ABAC90', 47.34628, 19.09011, 'Dunaharaszti pálya', 'Dunaharaszti skatepark', 'Kellemes, jó talajú beton skatepark pár percre Dunaharaszti vasútállomástól. Budapest Keleti pályaudvarról óránként megy ide vonat, fél óra alatt lent lehet lenni. A nagy ívek, döntöttfal és a félcső mellett a pálya szélén van egy street-es sáv, itt a funboxot, a manual padkát és a korlát szerű beton csúszót ajánlom deszkához. A többi elem főleg bicóra van méretezve, a félcső kifejezetten meredek. A "fő" pálya mellett körülbelül 100 méterre található egy "kezdő pálya" nevű második pálya is.', 'Nice concrete skatepark with smooth ground a few minutes from Dunaharaszti railway station. Trains run here from Budapest Keleti railway station every hour, you can be here in half an hour. In addition to the large ramps, walls and halfpipe, there is a street section at the side of the park, here I recommend the funbox, the manual pad and the rail-like concrete barrier for skating. The other elements are sized for bmx, the halfpipe is particularly steep. In addition to the "main" skatepark, there is a second park called the "starter skatepark" about 100 meters away.', 'skatepark', 5, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark4.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('01CCAD05-B5FD-4C65-92F9-E4F68A7F0D7D', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('2572B6D7-F82D-4EAD-8D3A-F7886C1F3560', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('EDDB0190-03F7-4AAA-9B60-A1447E50CAAA', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark3.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('CA60DBFC-1CF5-4175-8922-0BF8AB350FF7', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark4.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('77721B66-307A-482F-88A8-4E31944F8EBF', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark5.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('7505BD96-B068-4C9A-A328-906CBD0B5DA0', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark6.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('6BECB7A3-EED9-4801-8BDA-4B974BC7B742', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark7.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('D43F665B-E27F-4F48-9CA5-38CC8ED096D6', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark8.jpg');


COMMIT;

-----------------------------
---- PROPAGATE BASE DATA ----
-----------------------------

BEGIN;

--- Place data version
INSERT INTO "PlaceDataVersion" ("id", "dataVersion") VALUES ('4728D8FE-BD81-4961-88F3-E442A795179A', '2020-07-25 20:00:00');

--- Places and it's images
-- Dunaharaszti skatepark
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('1371AEF5-5782-49C6-B71B-F3D511ABAC90', 47.34628, 19.09011, 'Dunaharaszti pálya', 'Dunaharaszti skatepark', 'Kellemes, jó talajú beton skatepark pár percre Dunaharaszti vasútállomástól. Budapest Keleti pályaudvarról óránként megy ide vonat, fél óra alatt lent lehet lenni. A nagy ívek, döntöttfal és a félcső mellett a pálya szélén van egy street-es sáv, itt a funboxot, a manual padkát és a korlát szerű beton csúszót ajánlom deszkához. A többi elem főleg bicóra van méretezve, a félcső kifejezetten meredek. A "fő" pálya mellett körülbelül 100 méterre található egy "kezdő pálya" nevű második pálya is.', 'Nice concrete skatepark with smooth ground a few minutes from Dunaharaszti railway station. Trains run here from Budapest Keleti railway station every hour, you can be here in half an hour. In addition to the large ramps, walls and halfpipe, there is a street section at the side of the park, here I recommend the funbox, the manual pad and the rail-like concrete barrier for skating. The other elements are sized for bmx, the halfpipe is particularly steep. In addition to the "main" skatepark, there is a second park called the "starter skatepark" about 100 meters away.', 'skatepark', 7, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark4.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('01CCAD05-B5FD-4C65-92F9-E4F68A7F0D7D', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('2572B6D7-F82D-4EAD-8D3A-F7886C1F3560', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('EDDB0190-03F7-4AAA-9B60-A1447E50CAAA', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark3.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('CA60DBFC-1CF5-4175-8922-0BF8AB350FF7', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark4.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('77721B66-307A-482F-88A8-4E31944F8EBF', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark5.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('7505BD96-B068-4C9A-A328-906CBD0B5DA0', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark6.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('6BECB7A3-EED9-4801-8BDA-4B974BC7B742', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark7.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('D43F665B-E27F-4F48-9CA5-38CC8ED096D6', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/skate-budapest/images/dunaharaszti-skatepark8.jpg');

-- Veterinary university bench
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('5A816313-B02B-4C02-9A27-EFA71C19AC53', 47.50424, 19.07858, 'Állatorvosi egyetem padka', 'Veterinary university curb', 'A lépcsőfokokat mindkét irányból jó rágurulással lehet csúszkálni. A talaj minősége nem rossz, nem egy forgalmas környék.', 'You can slide on the stair steps from both directions. The pavement quality is not bad, and it''s not a busy street.', 'streetspot', 4, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/allatorvos-egyetem-padka1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('5088246E-BAA8-4C9E-AAED-D292F04A6D29', '5A816313-B02B-4C02-9A27-EFA71C19AC53', 'https://libertyskate.hu/mobile/skate-budapest/images/allatorvos-egyetem-padka1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('92FB43ED-0020-4A22-B4A9-778646697102', '5A816313-B02B-4C02-9A27-EFA71C19AC53', 'https://libertyskate.hu/mobile/skate-budapest/images/allatorvos-egyetem-padka2.jpg');

-- Arpad bridge park rail
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('166A31AE-472F-4DB8-B9B4-27372EE49907', 47.53440, 19.06706, 'Göncz park korlát', 'Göncz park rail', '4 lépcső korlát hosszú rágurulással, backside és frontside trükkökre is.', '4 stair handrail with long sidewalk, both for backside and frontside tricks.', 'streetspot', 4, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/goncz-park-korlat1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('4BE15D2B-0A8B-401B-9EF4-85D1F0669E51', '166A31AE-472F-4DB8-B9B4-27372EE49907', 'https://libertyskate.hu/mobile/skate-budapest/images/goncz-park-korlat1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('0D8A01F4-99AB-4DBB-9172-7E8C10FCB5B4', '166A31AE-472F-4DB8-B9B4-27372EE49907', 'https://libertyskate.hu/mobile/skate-budapest/images/goncz-park-korlat2.jpg');

-- Castle ledge
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('2645B735-A94E-424D-B3DC-B2E47952F40C', 47.49611, 19.04009, 'Vár szint', 'Castle ledge', 'Budai vár kupolája előtt egy körülbelül 120 centis szint található. A talaj minősége tökéletes. Érdemes a hétvégéket kerülni mert forgalmas hely.', 'In front of the dome of Buda Castle there is a ledge, height is about 120 centimeters. The ground is perfect. It''s worth avoiding weekends because it''s a busy place.', 'streetspot', 4, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/budai-var-szint1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F1BC64E0-CB13-45E2-9C5D-8DF44A006FC0', '2645B735-A94E-424D-B3DC-B2E47952F40C', 'https://libertyskate.hu/mobile/skate-budapest/images/budai-var-szint1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('30EBC6DB-7C69-4D0A-8A74-BB6A1BA4DFE0', '2645B735-A94E-424D-B3DC-B2E47952F40C', 'https://libertyskate.hu/mobile/skate-budapest/images/budai-var-szint2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('B84AAA8F-5AD7-433C-9A5C-8AC542037342', '2645B735-A94E-424D-B3DC-B2E47952F40C', 'https://libertyskate.hu/mobile/skate-budapest/images/budai-var-szint3.jpg');

-- Hungexpo curb
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('C34205E1-7F26-48DF-835C-557932DBB6C3', 47.49302, 19.12101, 'Hungexpo padka', 'Hungexpo ledge', 'Körülbelül 50 centi magas beton vasalt padka. A talaj minősége nem túl jó a rágurulásnál, de a padka jól csúszik grindokra.', 'About 50 centimeters high concrete ledge with metal bar. The quality of the ground is not very good, but it grinds very well.', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/hungexpo-padka1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F78C9035-5C24-47AC-BFCF-1202B5FF4567', 'C34205E1-7F26-48DF-835C-557932DBB6C3', 'https://libertyskate.hu/mobile/skate-budapest/images/hungexpo-padka1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('97F099A4-53E1-4509-8FF8-3404E81199C6', 'C34205E1-7F26-48DF-835C-557932DBB6C3', 'https://libertyskate.hu/mobile/skate-budapest/images/hungexpo-padka2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('926373C2-5C70-4B60-8622-ECE6D8B2A5BA', 'C34205E1-7F26-48DF-835C-557932DBB6C3', 'https://libertyskate.hu/mobile/skate-budapest/images/hungexpo-padka3.jpg');

-- Korosi promenade rail
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('5CF5A270-9321-4416-8052-EBECE0C9AD33', 47.48324, 19.12874, 'Kőrösi sétány korlát', 'Kőrösi promenade rail', 'Tört korlát a sétálóutcán amit oldalról ki lehet ugrani. Nem túl forgalmas szakasz, de a talaj kicsit rázós.', 'It''s a curved rail on the promenade, that you can jump over. It''s not a busy place but the ground is shaky.', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/korosi-setany-lepcso1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('3399CF36-1E4C-43D8-B077-D71FA8468E36', '5CF5A270-9321-4416-8052-EBECE0C9AD33', 'https://libertyskate.hu/mobile/skate-budapest/images/korosi-setany-lepcso1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('BC2F1E96-AD9D-4767-A79B-5D5E55A0A415', '5CF5A270-9321-4416-8052-EBECE0C9AD33', 'https://libertyskate.hu/mobile/skate-budapest/images/korosi-setany-lepcso2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('AE4A3560-DED5-4364-BB0F-F9FC19529811', '5CF5A270-9321-4416-8052-EBECE0C9AD33', 'https://libertyskate.hu/mobile/skate-budapest/images/korosi-setany-lepcso3.jpg');

-- Liget square rail
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('AA1DE273-DF9B-45D7-A6A5-55A20E603E83', 47.48219, 19.12966, 'Liget tér korlát', 'Liget square handrail', '5 lépcső korlát jó rágurulással és jó minőságű talajjal.', '5 stair handrail with smooth ground and long sidewalk before the rail.', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/liget-ter-korlat1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F7C490A5-5821-459F-B30F-6FD3A97C8990', 'AA1DE273-DF9B-45D7-A6A5-55A20E603E83', 'https://libertyskate.hu/mobile/skate-budapest/images/liget-ter-korlat1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('14ED03DA-2D79-4C4C-80A6-A394B2A4002C', 'AA1DE273-DF9B-45D7-A6A5-55A20E603E83', 'https://libertyskate.hu/mobile/skate-budapest/images/liget-ter-korlat2.jpg');

-- Medium shop
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('A5A0EF6C-EC8C-4C44-AAA6-292580FDA3A6', 47.50758, 19.05626, 'Medium skateshop', 'Medium skateshop', 'Jól felszerelt skateshop ahol a nagy márkák mellett Polar, Magenta és más kisebb brandek termékeit is megtalálod.', 'Well-equipped skateshop where you can find products from Polar, Magenta and other smaller brands in addition to the big brands.', 'skateshop', 5, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/medium-shop1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F86BFFE6-A069-436A-8A3B-6D7DB85EBE4E', 'A5A0EF6C-EC8C-4C44-AAA6-292580FDA3A6', 'https://libertyskate.hu/mobile/skate-budapest/images/medium-shop1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('8EE25DF1-CC01-430F-B53A-8089CD6366D0', 'A5A0EF6C-EC8C-4C44-AAA6-292580FDA3A6', 'https://libertyskate.hu/mobile/skate-budapest/images/medium-shop2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('4152D1C8-67C9-4965-8B8D-6C6377B7A0FE', 'A5A0EF6C-EC8C-4C44-AAA6-292580FDA3A6', 'https://libertyskate.hu/mobile/skate-budapest/images/medium-shop3.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('DF0456EA-1E14-4B27-8DFA-E6EE5AFADF71', 'A5A0EF6C-EC8C-4C44-AAA6-292580FDA3A6', 'https://libertyskate.hu/mobile/skate-budapest/images/medium-shop4.jpg');

-- Mexico bar gap
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('1AC2D903-AEB3-4F0A-B4EA-D5E965A375EA', 47.49207, 19.02393, 'Mexikói bár gap', 'Mexico bar gap', 'A két növény között ki lehet ugrani a gapet. Érdemes este, zárás után felkeresni a helyet.', 'You can jump over the gap between the two plants. It''s worth visiting the spot in the evening, after closing.', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/mexico-bar-gap1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('38D1A504-3DCF-4151-B45E-3DF085B02361', '1AC2D903-AEB3-4F0A-B4EA-D5E965A375EA', 'https://libertyskate.hu/mobile/skate-budapest/images/mexico-bar-gap1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('A17F8F4C-ACCD-4F88-B57E-C7350896785C', '1AC2D903-AEB3-4F0A-B4EA-D5E965A375EA', 'https://libertyskate.hu/mobile/skate-budapest/images/mexico-bar-gap2.jpg');

-- Mom cult stair
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('24C557B8-FD74-47F7-BA6E-FB8801A20175', 47.49028, 19.01906, 'Mom kult. központ lépcsők', 'Mom cult center stairs', 'Nyújtott 3 lépcső hosszú ráhajtással. A spot mellett van egy padka is amit ki lehet csúszni egy bokor mellett.', 'Long 3 stair with long sidewalk to take speed. Next to the spot there is a ledge that can be slide out next to a bush.', 'streetspot', 5, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-kult-lepcso1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('72896970-E276-4DF5-A2E5-5D459C038861', '24C557B8-FD74-47F7-BA6E-FB8801A20175', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-kult-lepcso1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('1AF86ECE-7C91-49C1-A134-DA0C4BE86FF6', '24C557B8-FD74-47F7-BA6E-FB8801A20175', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-kult-lepcso2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('37AF0798-8924-4CA8-8D32-9DD557AA7488', '24C557B8-FD74-47F7-BA6E-FB8801A20175', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-kult-lepcso3.jpg');

-- Mom plaza ledges
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('D428206A-DEF9-488B-8474-97304DECCA70', 47.49047, 19.02111, 'Mom pláza padkák', 'Mom plaza ledges', 'Lépcső melletti márvány padkák a pláza oldalában több helyen.', 'Marble ledges with stairs at the side of the plaza in several places.', 'streetspot', 4, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-plaza-ledge1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F9679EF1-D4DD-4C7B-8FB0-7FC2B967B840', 'D428206A-DEF9-488B-8474-97304DECCA70', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-plaza-ledge1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('6876ECCC-8456-4245-A478-3B2A153C2377', 'D428206A-DEF9-488B-8474-97304DECCA70', 'https://libertyskate.hu/mobile/skate-budapest/images/mom-plaza-ledge2.jpg');

-- Congress Center stair
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('E80CF3ED-2D88-41C8-BAE9-DEE4DC6E5DF7', 47.48818, 19.02205, 'Kongresszusi közp. lépcső', 'Congress Center stair', '5 lépcső amit magában vagy az utána lévő 2 lépcsővel együtt is ki lehet ugrani.', '5 stairs that you can jump alone or together with the 2 stair as a double set.', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/kongresszusi-kozp-stair1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('8DEBA80E-3523-4C27-B77B-E18356123EB9', 'E80CF3ED-2D88-41C8-BAE9-DEE4DC6E5DF7', 'https://libertyskate.hu/mobile/skate-budapest/images/kongresszusi-kozp-stair1.jpg');

-- Pesterzsebet fence gap
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('5D98AF87-69D9-4087-9C7D-D4FFA60F0556', 47.43898, 19.10278, 'Pesterzsebet gap korláttal', 'Pesterzsebet gap with fence', 'Egy játszótér szélén található ez a szint amit egy alacsony fa kerítés fölött lehet kiugrani.', 'Next to a playground there is a gap that can be jumped over a low wooden fence.', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/pesterzsebet-kerites-gap1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('A61CF81B-BA4D-465F-9DAA-D479C73BE28F', '5D98AF87-69D9-4087-9C7D-D4FFA60F0556', 'https://libertyskate.hu/mobile/skate-budapest/images/pesterzsebet-kerites-gap1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('75BC26E7-3286-499B-B250-8F3E61D4DF37', '5D98AF87-69D9-4087-9C7D-D4FFA60F0556', 'https://libertyskate.hu/mobile/skate-budapest/images/pesterzsebet-kerites-gap2.jpg');

INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 47.54344, 19.04594, 'Óbuda pálya', 'Óbuda skatepark', 'Laktanya utcai skatepark remek választás ha padka trükköket gyakorolnál. Van itt íves, tört és egyenes padka is különböző magasságokban. Összességében jó minőségű csiszolt beton elemek alkotják a pályát, a talaj minősége nem rossz. Az egyik fő elem az egymásnak szembe fordított kidobók amit így transzferben át lehet ugrani.', 'The skatepark at the Laktanya street is a great choice if you''re learning tricks on the ledge. There are curved and straight ledges with different heights. Overall the concrete elements are good quality, the ground is not bad. The main element are the pair of kickers that you can jump in transfer.', 'skatepark', 8, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('F2D5A981-EB79-43D6-9F8D-D5CD01C2558C', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark1.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('578CE718-33E1-4ED7-9E3D-A294A3128BC7', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark2.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('040A6687-3B20-4C11-B21C-2F36FB825905', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark3.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('678B8955-0687-4BE2-BE23-E37F822E22B4', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark4.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('6A06D637-DF56-48AF-AEDC-3A527E693E33', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark5.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('C0E84EEE-D9FF-473A-85A9-F45BB7DAE530', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark6.jpg');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('A83C96AA-F571-41D4-8541-A2C9E5F9617E', 'F7C1EABC-5F7F-4522-A35A-50D2DB30D847', 'https://libertyskate.hu/mobile/skate-budapest/images/obuda-skatepark7.jpg');

COMMIT;


-- TEMPLATE
/*
INSERT INTO "Place" ("id", "latitude", "longitude", "nameHU", "nameEN", "infoHU", "infoEN", "type", "priority", "status", "thumbnailUrl") VALUES ('uuid', 47, 19, 'titleHU', 'titleEN', 'descHU', 'descEN', 'streetspot', 3, 'active', 'https://libertyskate.hu/mobile/skate-budapest/images/');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('uuid', 'fuuid', 'https://libertyskate.hu/mobile/skate-budapest/images/');
INSERT INTO "PlaceImage" ("id", "placeId", "imageUrl") VALUES ('uuid', 'fuuid', 'https://libertyskate.hu/mobile/skate-budapest/images/');
*/

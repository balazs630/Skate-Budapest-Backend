PRAGMA foreign_keys = OFF;

BEGIN TRANSACTION;

-- Drop & create tables
DROP TABLE IF EXISTS PlaceImages;
CREATE TABLE PlaceImages (
	id TEXT NOT NULL,
  	placeId TEXT NOT NULL,
	imageUrl TEXT NOT NULL,
  PRIMARY KEY(id)
);

DROP TABLE IF EXISTS Places;
CREATE TABLE Places (
	id TEXT NOT NULL,
	latitude REAL NOT NULL,
	longitude REAL NOT NULL,
	name TEXT NOT NULL,
	info TEXT NOT NULL,
	type TEXT NOT NULL,
	status TEXT NOT NULL,
	thumbnailUrl TEXT,
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES PlaceImages(placeId) ON UPDATE SET NULL ON DELETE SET NULL
);

DROP TABLE IF EXISTS PlaceInfo;
CREATE TABLE PlaceInfo (
	dataVersion	TEXT NOT NULL
);

DROP TABLE IF EXISTS PlaceSuggestions;
CREATE TABLE PlaceSuggestions (
    id TEXT NOT NULL,
    latitude REAL NOT NULL,
    longitude REAL NOT NULL,
    name TEXT NOT NULL,
    info TEXT NOT NULL,
    type TEXT NOT NULL,
    -- image1 BLOB NOT NULL,
    -- image2 BLOB NOT NULL,
    -- image3 BLOB,
    -- image4 BLOB,
    PRIMARY KEY(id)
);

-- Propagate base data
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('3D8AC01C-DDDA-41F1-958F-DE0C80271CD0', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/example/images/Helicopter.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('8DB68607-2F31-4A64-B132-B4E43E94A4C9', '1371AEF5-5782-49C6-B71B-F3D511ABAC90', 'https://libertyskate.hu/mobile/example/images/Helicopter.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('92AB0932-5CE3-4639-A761-27B26E859F3C', 'D16EEC15-DAB4-4E90-86BE-C5884F0C3B34', 'https://libertyskate.hu/mobile/example/images/Crag.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('132B0416-35BD-4F62-9D13-AF5E959EB6E7', '61BE013D-28BD-40ED-AB4F-D678AACD0B04', 'https://libertyskate.hu/mobile/example/images/FreshTracks.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('1464DCE9-6962-41F6-B10C-95B17498A26A', '61BE013D-28BD-40ED-AB4F-D678AACD0B04', 'https://libertyskate.hu/mobile/example/images/FreshTracks.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('F43C11DE-4D5D-4E8A-974E-94C4A57D854E', '6F64B5D7-4EB6-4BB6-A719-95912101A8E7', 'https://libertyskate.hu/mobile/example/images/Mountain.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('188DDCC7-4EF3-48C3-8D8F-898962A93E61', '6F64B5D7-4EB6-4BB6-A719-95912101A8E7', 'https://libertyskate.hu/mobile/example/images/Mountain.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('AE229BDB-02B0-4C3C-B207-FF7B6D048B4B', '0FC2EDBA-01CD-4376-81A5-A3FD872BB7EB', 'https://libertyskate.hu/mobile/example/images/PileOfSkis.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('F147E85D-5740-4692-B265-87150AC3BE3F', '62AA30F7-0D61-4006-B417-B9E34A3190DA', 'https://libertyskate.hu/mobile/example/images/Cockpit.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('71178B9E-92A3-4B81-A40D-EC5C24F377EE', '62AA30F7-0D61-4006-B417-B9E34A3190DA', 'https://libertyskate.hu/mobile/example/images/Cockpit.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('13E9348A-02D4-4B4F-B10E-F54317BFE1D3', '0CF937B2-C509-4677-B109-4B7E1D9E8791', 'https://libertyskate.hu/mobile/example/images/Panorama.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('C2F66244-8B60-496F-B77D-6CAD142EC947', '8A5549E5-C122-47F8-B446-292A71B68A7A', 'https://libertyskate.hu/mobile/example/images/Curling.jpg');
INSERT INTO PlaceImages (id, placeId, imageUrl) VALUES ('A13E7021-9031-4FC2-A58D-7F1CAE54A995', '8A5549E5-C122-47F8-B446-292A71B68A7A', 'https://libertyskate.hu/mobile/example/images/Curling.jpg');

INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('1371AEF5-5782-49C6-B71B-F3D511ABAC90', 47.497912, 19.040235, 'Helicopter', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', 'skatepark', 'active', 'https://libertyskate.hu/mobile/example/images/Helicopter.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('D16EEC15-DAB4-4E90-86BE-C5884F0C3B34', 47.539016, 19.034754, 'Top of First Run', 'Incredible views from up here.', 'skatepark', 'active', 'https://libertyskate.hu/mobile/example/images/Crag.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('61BE013D-28BD-40ED-AB4F-D678AACD0B04', 47.420912, 19.090235, 'Nice Tracks', 'Oh no! Clouds rolling in.', 'skatepark', 'active', NULL);
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('FBC6DB92-9B2B-476E-978E-1F5E5939D262', 47.560912, 19.160235, 'Incoming!', 'Brace yourself for fierce wind.', 'streetspot', 'active', 'https://libertyskate.hu/mobile/example/images/HelicopterLanding.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('6F64B5D7-4EB6-4BB6-A719-95912101A8E7', 47.380912, 19.044235, 'Valley Floor', 'Views are spectacular even from here.', 'streetspot', 'active', 'https://libertyskate.hu/mobile/example/images/Mountain.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('0FC2EDBA-01CD-4376-81A5-A3FD872BB7EB', 47.450912, 19.320235, 'Ready for Pickup', 'This isn’t Jenga, stack ‘em neatly.', 'streetspot', 'active', 'https://libertyskate.hu/mobile/example/images/PileOfSkis.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('62AA30F7-0D61-4006-B417-B9E34A3190DA', 47.607912, 19.120235, 'Flying', 'Wouldn’t you love to be at the controls?', 'skateshop', 'active', 'https://libertyskate.hu/mobile/example/images/Cockpit.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('0CF937B2-C509-4677-B109-4B7E1D9E8791', 47.486818, 19.014536, 'Panorama', 'Cool iPhone feature.', 'skateshop', 'active', 'https://libertyskate.hu/mobile/example/images/Panorama.png');
INSERT INTO Places (id, latitude, longitude, name, info, type, status, thumbnailUrl) VALUES ('8A5549E5-C122-47F8-B446-292A71B68A7A', 47.510258, 19.082678, 'Apres Ski', 'In Canada, after all.', 'skateshop', 'inactive', 'https://libertyskate.hu/mobile/example/images/Curling.png');

INSERT INTO PlaceInfo (dataVersion) VALUES ('1.0');

COMMIT;

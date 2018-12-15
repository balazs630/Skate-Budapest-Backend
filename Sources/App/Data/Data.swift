//
//  Data.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 23..
//

struct Data {
    /* HACK:
        On vapor.cloud.com using a database have monthly fees. I'm currently deploying this API on a free plan.
        Since this API will only have GET endpoints, I've declared all data here which I want to return in the json responses.
        Moving all this stuff to a database later...
    */
    static let placeDataVersion = PlaceInfoDTO(dataVersion: "1.0")
    static let places = [
        PlaceDTO(
            id: "1371AEF5-5782-49C6-B71B-F3D511ABAC90",
            latitude: 47.497912,
            longitude: 19.040235,
            name: "Helicopter",
            info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            type: .skatepark,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/Helicopter.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/Helicopter.jpg",
                "https://libertyskate.hu/mobile/example/images/Helicopter.jpg"
            ]
        ),
        PlaceDTO(
            id: "D16EEC15-DAB4-4E90-86BE-C5884F0C3B34",
            latitude: 47.539016,
            longitude: 19.034754,
            name: "Top of First Run",
            info: "Incredible views from up here.",
            type: .skatepark,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/Crag.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/Crag.jpg"
            ]
        ),
        PlaceDTO(
            id: "61BE013D-28BD-40ED-AB4F-D678AACD0B04",
            latitude: 47.420912,
            longitude: 19.090235,
            name: "Nice Tracks",
            info: "Oh no! Clouds rolling in.",
            type: .skatepark,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/FreshTracks.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/FreshTracks.jpg",
                "https://libertyskate.hu/mobile/example/images/FreshTracks.jpg"
            ]
        ),
        PlaceDTO(
            id: "FBC6DB92-9B2B-476E-978E-1F5E5939D262",
            latitude: 47.560912,
            longitude: 19.160235,
            name: "Incoming!",
            info: "Brace yourself for fierce wind.",
            type: .streetspot,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/HelicopterLanding.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/HelicopterLanding.jpg"
            ]
        ),
        PlaceDTO(
            id: "6F64B5D7-4EB6-4BB6-A719-95912101A8E7",
            latitude: 47.380912,
            longitude: 19.044235,
            name: "Valley Floor",
            info: "Views are spectacular even from here.",
            type: .streetspot,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/Mountain.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/Mountain.jpg",
                "https://libertyskate.hu/mobile/example/images/Mountain.jpg"
            ]
        ),
        PlaceDTO(
            id: "0FC2EDBA-01CD-4376-81A5-A3FD872BB7EB",
            latitude: 47.450912,
            longitude: 19.320235,
            name: "Ready for Pickup",
            info: "This isn’t Jenga, stack ‘em neatly.",
            type: .streetspot,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/PileOfSkis.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/PileOfSkis.jpg"
            ]
        ),
        PlaceDTO(
            id: "62AA30F7-0D61-4006-B417-B9E34A3190DA",
            latitude: 47.607912,
            longitude: 19.120235,
            name: "Flying",
            info: "Wouldn’t you love to be at the controls?",
            type: .skateshop,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/Cockpit.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/Cockpit.jpg",
                "https://libertyskate.hu/mobile/example/images/Cockpit.jpg"
            ]
        ),
        PlaceDTO(
            id: "0CF937B2-C509-4677-B109-4B7E1D9E8791",
            latitude: 47.486818,
            longitude: 19.014536,
            name: "Panorama",
            info: "Cool iPhone feature.",
            type: .skateshop,
            status: .active,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/Panorama.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/Panorama.jpg"
            ]
        ),
        PlaceDTO(
            id: "8A5549E5-C122-47F8-B446-292A71B68A7A",
            latitude: 47.510258,
            longitude: 19.082678,
            name: "Apres Ski",
            info: "In Canada, after all.",
            type: .skateshop,
            status: .inactive,
            thumbnailUrl: "https://libertyskate.hu/mobile/example/images/Curling.png",
            imageUrls: [
                "https://libertyskate.hu/mobile/example/images/Curling.jpg",
                "https://libertyskate.hu/mobile/example/images/Curling.jpg"
            ]
        )
    ]
}

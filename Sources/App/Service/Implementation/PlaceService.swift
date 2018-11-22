//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

final class PlaceService: PlaceServiceInterface {
    /* HACK:
        On vapor.cloud.com using a database have monthly fees. I'm currently on a free plan.
        Since this API will only have GET endpoints, I've declared all data here which I want to return in the json responses.
        Moving all this stuff to a database later...
    */

    func getWaypointInfo() -> WaypointInfo {
        return WaypointInfo(version: "1.0")
    }

    func getWaypoints() -> [Waypoint] {
        let testWaypoint = Waypoint(
            id: "1371AEF5-5782-49C6-B71B-F3D511ABAC90",
            latitude: 47.497912,
            longitude: 19.040235,
            name: "Helicopter",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            type: .skatepark,
            status: .active,
            images: [
                WaypointImage(imageUrl: "https://libertyskate.hu/mobile/example/images/Helicopter.png",
                              imageSizeClass: .thumbnail),
                WaypointImage(imageUrl: "https://libertyskate.hu/mobile/example/images/Helicopter.png",
                              imageSizeClass: .large)
            ]
        )

        return [testWaypoint]
    }
}

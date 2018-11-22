//
//  PlaceService.swift
//  SkateBudapestBackend
//
//  Created by Horváth Balázs on 2018. 11. 21..
//

final class PlaceService: PlaceServiceInterface {
    func getSimplePlace() -> Place {
          return Place(id: 1, title: "title")
    }
}

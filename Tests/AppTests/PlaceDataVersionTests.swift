//
//  PlaceDataVersionTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import XCTVapor

final class PlaceDataVersionTests: XCTVaporTests {
    // MARK: Properties
    private let placeDataVersionURI = "/api/v1/places/data_version"
}

// MARK: Happy case tests
extension PlaceDataVersionTests {
    func testPlaceDataVersionCanBeRetrievedAndInPast() throws {
        try app.test(.GET, placeDataVersionURI, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode(PlaceDataVersionResponseDTO.self)

            XCTAssertTrue(result.dataVersion < Date())
        })
    }
}

// MARK: Error case tests
extension PlaceDataVersionTests {
    func testPlaceDataVersionCannotBeRetrievedWithoutApiKey() throws {
        try app.test(.GET, placeDataVersionURI, headers: [:], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
        })
    }

    func testPlaceDataVersionCannotBeRetrievedWitInvalidApiKey() throws {
        try app.test(.GET, placeDataVersionURI, headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid Api-Key!")
        })
    }
}

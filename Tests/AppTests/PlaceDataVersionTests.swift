//
//  PlaceDataVersionTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import XCTVapor

final class PlaceDataVersionTests: XCTestCase {
    // MARK: Properties
    private var app: Application!
    private var testingHeaders: HTTPHeaders!
    private let placeDataVersionURI = "/api/v1/places/data_version"

    // MARK: Setup & Teardown
    override func setUpWithError() throws {
        app = Application(.testing)
        testingHeaders = HTTPHeaders([
            ("Api-Key", try! EnvironmentVariable.serverApiKey.value())
        ])

        try configure(app)
    }

    override func tearDown() {
        app.shutdown()
    }
}

// MARK: Happy test cases
extension PlaceDataVersionTests {
    func testPlaceDataVersionCanBeRetrievedAndInPast() throws {
        try app.test(.GET, placeDataVersionURI, headers: testingHeaders) { response in
            let result = try response.content.decode(PlaceDataVersionResponseDTO.self)

            XCTAssertTrue(result.dataVersion < Date())
        }
    }
}

// MARK: Error test cases
extension PlaceDataVersionTests {
    func testPlaceDataVersionCannotBeRetrievedWithoutApiKey() throws {
        try app.test(.GET, placeDataVersionURI, headers: [:]) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
        }
    }

    func testPlaceDataVersionCannotBeRetrievedWitInvalidApiKey() throws {
        try app.test(.GET, placeDataVersionURI, headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"]) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid Api-Key!")
        }
    }
}

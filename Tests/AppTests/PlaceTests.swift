//
//  PlaceTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 16..
//

@testable import App
import XCTVapor

final class PlaceTests: XCTestCase {
    // MARK: Properties
    let listPlacesURI = "/api/v1/places"
    let testingHeaders = HTTPHeaders([("Api-Key", LocalConstant.Testing.serverApiKey)])
}

// MARK: Happy test cases
extension PlaceTests {
    func testPlacesCanBeRetrievedWithHULanguageAndActiveStatus() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        let queryParams = "?lang=hu&status=active"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders) { response in
            let result = try response.content.decode([PlaceResponseDTO].self)

            XCTAssertNotNil(result)
        }
    }

    func testPlacesCanBeRetrievedWithENLanguageAndDeletedStatus() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        let queryParams = "?lang=en&status=deleted"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders) { response in
            let result = try response.content.decode([PlaceResponseDTO].self)

            XCTAssertNotNil(result)
        }
    }

    func testPlacesCanBeRetrievedWithHULanguage() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        let queryParams = "?lang=hu"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders) { response in
            let result = try response.content.decode([PlaceResponseDTO].self)

            XCTAssertNotNil(result)
        }
    }
}

// MARK: Error test cases
extension PlaceTests {
    func testPlacesCannotBeRetrievedWithoutApiKey() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, listPlacesURI, headers: [:]) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
        }
    }

    func testPlacesCannotBeRetrievedWitInvalidApiKey() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, listPlacesURI, headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"]) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid Api-Key!")
        }
    }

    func testPlacesCannotBeRetrievedWithoutLangParam() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        try app.test(.GET, listPlacesURI, headers: testingHeaders) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Value of type 'String' required for key 'lang'.")
        }
    }

    func testPlacesCannotBeRetrievedWithInvalidLangParam() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        let queryParams = "?lang=invalid"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid `lang` parameter.")
        }
    }

    func testPlacesCannotBeRetrievedWithInvalidStatusParam() throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try configure(app)

        let queryParams = "?lang=hu&status=invalid"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders) { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid `status` parameter.")
        }
    }
}

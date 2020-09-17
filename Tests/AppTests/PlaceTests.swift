//
//  PlaceTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 16..
//

@testable import App
import XCTVapor

final class PlaceTests: XCTVaporTests {
    // MARK: Properties
    private let listPlacesURI = "/api/v1/places"
}

// MARK: Happy case tests
extension PlaceTests {
    func testPlacesCanBeRetrievedWithHULanguageAndActiveStatus() throws {
        let queryParams = "?lang=hu&status=active"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlacesCanBeRetrievedWithENLanguageAndDeletedStatus() throws {
        let queryParams = "?lang=en&status=deleted"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlacesCanBeRetrievedWithHULanguage() throws {
        let queryParams = "?lang=hu"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }
}

// MARK: Error case tests
extension PlaceTests {
    func testPlacesCannotBeRetrievedWithoutApiKey() throws {
        try app.test(.GET, listPlacesURI, headers: [:], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
        })
    }

    func testPlacesCannotBeRetrievedWitInvalidApiKey() throws {
        try app.test(.GET, listPlacesURI, headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid Api-Key!")
        })
    }

    func testPlacesCannotBeRetrievedWithoutLangParam() throws {
        try app.test(.GET, listPlacesURI, headers: testingHeaders, afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Value of type 'String' required for key 'lang'.")
        })
    }

    func testPlacesCannotBeRetrievedWithInvalidLangParam() throws {
        let queryParams = "?lang=invalid"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid `lang` parameter.")
        })
    }

    func testPlacesCannotBeRetrievedWithInvalidStatusParam() throws {
        let queryParams = "?lang=hu&status=invalid"

        try app.test(.GET, listPlacesURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid `status` parameter.")
        })
    }
}

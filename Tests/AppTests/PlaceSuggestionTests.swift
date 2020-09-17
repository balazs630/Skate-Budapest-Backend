//
//  PlaceSuggestionTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import XCTVapor

final class PlaceSuggestionTests: XCTVaporTests {
    // MARK: Properties
    private let suggestPlaceURI = "/api/v1/suggest_place"
    private let listPlaceSuggestionsURI = "/api/v1/place_suggestions"
}

// MARK: Happy case tests
extension PlaceSuggestionTests {
    func testPlaceSuggestionsCanBeRetrieved() throws {
        try app.test(.GET, listPlaceSuggestionsURI, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceSuggestionResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlaceSuggestionsCanBeRetrievedWithActiveStatus() throws {
        let queryParams = "?status=active"

        try app.test(.GET, listPlaceSuggestionsURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceSuggestionResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlaceSuggestionsCanBeRetrievedWithDeletedStatus() throws {
        let queryParams = "?status=deleted"

        try app.test(.GET, listPlaceSuggestionsURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceSuggestionResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlaceSuggestionCanBeSavedAndRetrived() throws {
        let newSuggestion = PlaceSuggestionRequestDTO(
            latitude: 47.497913360595703,
            longitude: 19.034753799438477,
            name: String.random(length: 12),
            info: String.random(length: 50),
            type: String.random(length: 8),
            senderEmail: "\(String.random(length: 8))@test.com",
            image1: Data(),
            image2: Data(),
            image3: Data(),
            image4: Data()
        )

        try app.test(.POST, suggestPlaceURI, headers: testingHeaders, beforeRequest: { request in
            try request.content.encode(newSuggestion)
        }, afterResponse: { res in
            let responseModel = try res.content.decode(GeneralSuccessDTO.self)
            XCTAssertEqual(responseModel.status, .created)
            XCTAssertEqual(responseModel.message, "Place suggestion is created!")
        })

        try app.test(.GET, listPlaceSuggestionsURI, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceSuggestionResponseDTO].self)
            let matchingResults = result.filter { $0.isEqual(to: newSuggestion) }

            XCTAssertEqual(matchingResults.count, 1)
        })
    }
}

// MARK: Error case tests
extension PlaceSuggestionTests {
    func testPlaceSuggestionsCannotBeRetrievedWithoutApiKey() throws {
        try app.test(.GET, listPlaceSuggestionsURI, headers: [:], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
        })
    }

    func testPlaceSuggestionsCannotBeRetrievedWitInvalidApiKey() throws {
        try app.test(.GET, listPlaceSuggestionsURI, headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid Api-Key!")
        })
    }

    func testPlaceSuggestionsCannotBeRetrievedWithInvalidStatusParam() throws {
        let queryParams = "?lang=hu&status=invalid"

        try app.test(.GET, listPlaceSuggestionsURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid `status` parameter.")
        })
    }

    func testPlaceSuggestionCannotBeSavedWithInvalidFields() throws {
        let newSuggestion = PlaceSuggestionRequestDTO(
            latitude: 47,
            longitude: 19,
            name: String.random(length: 2),
            info: String.random(length: 9),
            type: String.random(length: 8),
            senderEmail: String.random(length: 8),
            image1: Data(),
            image2: Data(),
            image3: nil,
            image4: nil
        )

        try app.test(.POST, suggestPlaceURI, headers: testingHeaders, beforeRequest: { request in
            try request.content.encode(newSuggestion)
        }, afterResponse: { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "name is less than minimum of 3 character(s),"
                + " info is less than minimum of 10 character(s),"
                + " senderEmail is not a valid email address")
        })
    }
}

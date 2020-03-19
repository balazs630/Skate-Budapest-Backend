//
//  PlaceSuggestionTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import Vapor
import XCTest
import FluentPostgreSQL

final class PlaceSuggestionTests: XCTestCase {
    // MARK: Properties
    let suggestPlaceURI = "/api/v1/suggest_place"
    let listPlaceSuggestionsURI = "/api/v1/place_suggestions"
    let testingHeaders = HTTPHeaders([("Api-Key", LocalConstant.Testing.serverApiKey)])
    var app: Application!
    var connection: PostgreSQLConnection!

    // MARK: Setup - teardown
    override func setUp() {
        app = try? Application.testable()
        connection = try? app.newConnection(to: .psql).wait()
    }

    override func tearDown() {
        connection.close()
        try? app.syncShutdownGracefully()
    }
}

// MARK: Happy test cases
extension PlaceSuggestionTests {
    func testPlaceSuggestionsCanBeRetrieved() throws {
        let placeSuggestions = try app.getResponse(to: listPlaceSuggestionsURI,
                                                   method: .GET,
                                                   headers: testingHeaders,
                                                   decodeTo: [PlaceSuggestionResponseDTO].self)

        XCTAssertNotNil(placeSuggestions)
    }

    func testPlaceSuggestionsCanBeRetrievedWithActiveStatus() throws {
        let queryParams = "?status=active"
        let placeSuggestions = try app.getResponse(to: listPlaceSuggestionsURI + queryParams,
                                                   method: .GET,
                                                   headers: testingHeaders,
                                                   decodeTo: [PlaceSuggestionResponseDTO].self)

        XCTAssertNotNil(placeSuggestions)
    }

    func testPlaceSuggestionsCanBeRetrievedWithDeletedStatus() throws {
        let queryParams = "?status=deleted"
        let placeSuggestions = try app.getResponse(to: listPlaceSuggestionsURI + queryParams,
                                                   method: .GET,
                                                   headers: testingHeaders,
                                                   decodeTo: [PlaceSuggestionResponseDTO].self)

        XCTAssertNotNil(placeSuggestions)
    }

    func testPlaceSuggestionCanBeSavedAndRetrived() throws {
        let newSuggestion = PlaceSuggestionRequestDTO(latitude: 47.497913360595703,
                                                      longitude: 19.034753799438477,
                                                      name: String.random(length: 12),
                                                      info: String.random(length: 50),
                                                      type: String.random(length: 8),
                                                      senderEmail: "\(String.random(length: 8))@test.com",
                                                      image1: Data(),
                                                      image2: Data(),
                                                      image3: Data(),
                                                      image4: Data())

        _ = try app.sendRequest(to: suggestPlaceURI,
                                method: .POST,
                                headers: testingHeaders,
                                body: newSuggestion)

        let placeSuggestions = try app.getResponse(to: listPlaceSuggestionsURI,
                                                   method: .GET,
                                                   headers: testingHeaders,
                                                   decodeTo: [PlaceSuggestionResponseDTO].self)

        let matchingResults = placeSuggestions.filter { $0.isEqual(to: newSuggestion) }

        XCTAssertEqual(matchingResults.count, 1)
    }
}

// MARK: Error test cases
extension PlaceSuggestionTests {
    func testPlaceSuggestionsCannotBeRetrievedWithoutApiKey() throws {
        let error = try app.getResponse(to: listPlaceSuggestionsURI,
                                        method: .GET,
                                        headers: [:],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
    }

    func testPlaceSuggestionsCannotBeRetrievedWitInvalidApiKey() throws {
        let error = try app.getResponse(to: listPlaceSuggestionsURI,
                                        method: .GET,
                                        headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid Api-Key!")
    }

    func testPlaceSuggestionsCannotBeRetrievedWithInvalidStatusParam() throws {
        let queryParams = "?lang=hu&status=invalid"
        let error = try app.getResponse(to: listPlaceSuggestionsURI + queryParams,
                                        method: .GET,
                                        headers: testingHeaders,
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid `status` parameter.")
    }

    func testPlaceSuggestionCannotBeSavedWithInvalidFields() throws {
        let newSuggestion = PlaceSuggestionRequestDTO(latitude: 47,
                                                      longitude: 19,
                                                      name: String.random(length: 2),
                                                      info: String.random(length: 9),
                                                      type: String.random(length: 8),
                                                      senderEmail: String.random(length: 8),
                                                      image1: Data(),
                                                      image2: Data(),
                                                      image3: nil,
                                                      image4: nil)

        let response = try app.sendRequest(to: suggestPlaceURI,
                                           method: .POST,
                                           headers: testingHeaders,
                                           body: newSuggestion)

        _ = try response.content.decode(GeneralErrorDTO.self).map { error in
            XCTAssertEqual(error.reason, "'name' is less than required minimum of 3 characters,"
                + " 'info' is less than required minimum of 10 characters,"
                + " 'senderEmail' is not a valid email address")
        }
    }
}



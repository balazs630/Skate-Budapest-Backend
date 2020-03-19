//
//  PlaceTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 16..
//

@testable import App
import Vapor
import XCTest
import FluentPostgreSQL

final class PlaceTests: XCTestCase {
    // MARK: Properties
    let placesURI = "/api/v1/places"
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

// MARK: Place tests
extension PlaceTests {
    func testPlacesCannotBeRetrievedWithoutApiKey() throws {
        let error = try app.getResponse(to: placesURI,
                                        method: .GET,
                                        headers: [:],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
    }

    func testPlacesCannotBeRetrievedWitInvalidApiKey() throws {
        let error = try app.getResponse(to: placesURI,
                                        method: .GET,
                                        headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid Api-Key!")
    }

    func testPlacesCannotBeRetrievedWithoutLangParam() throws {
        let error = try app.getResponse(to: placesURI,
                                        method: .GET,
                                        headers: testingHeaders,
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Value of type \'String\' required for key \'lang\'.")
    }

    func testPlacesCannotBeRetrievedWithInvalidLangParam() throws {
        let queryParams = "?lang=invalid"
        let error = try app.getResponse(to: placesURI + queryParams,
                                        method: .GET,
                                        headers: testingHeaders,
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid `lang` parameter.")
    }

    func testPlacesCannotBeRetrievedWithInvalidStatusParam() throws {
        let queryParams = "?lang=hu&status=invalid"
        let error = try app.getResponse(to: placesURI + queryParams,
                                        method: .GET,
                                        headers: testingHeaders,
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid `status` parameter.")
    }
}

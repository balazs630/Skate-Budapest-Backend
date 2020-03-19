//
//  PlaceDataVersionTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import Vapor
import XCTest
import FluentPostgreSQL

final class PlaceDataVersionTests: XCTestCase {
    // MARK: Properties
    let placeDataVersionURI = "/api/v1/places/data_version"
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
extension PlaceDataVersionTests {
    func testPlaceDataVersionCanBeRetrievedAndInPast() throws {
        let dataVersion = try app.getResponse(to: placeDataVersionURI,
                                              method: .GET,
                                              headers: testingHeaders,
                                              decodeTo: PlaceDataVersionResponseDTO.self)

        XCTAssertEqual(dataVersion.dataVersion < Date(), true)
    }
}

// MARK: Error test cases
extension PlaceDataVersionTests {
    func testPlaceDataVersionCannotBeRetrievedWithoutApiKey() throws {
        let error = try app.getResponse(to: placeDataVersionURI,
                                        method: .GET,
                                        headers: [:],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
    }

    func testPlaceDataVersionCannotBeRetrievedWitInvalidApiKey() throws {
        let error = try app.getResponse(to: placeDataVersionURI,
                                        method: .GET,
                                        headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid Api-Key!")
    }
}

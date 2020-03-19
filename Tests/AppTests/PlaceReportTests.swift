//
//  PlaceReportTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import Vapor
import XCTest
import FluentPostgreSQL

final class PlaceReportTests: XCTestCase {
    // MARK: Properties
    let reportPlaceURI = "/api/v1/report_place"
    let listPlaceReportsURI = "/api/v1/place_reports"
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
extension PlaceReportTests {
    func testPlaceReportsCanBeRetrieved() throws {
        let placeReports = try app.getResponse(to: listPlaceReportsURI,
                                              method: .GET,
                                              headers: testingHeaders,
                                              decodeTo: [PlaceReportResponseDTO].self)

        XCTAssertNotNil(placeReports)
    }

    func testPlaceReportsCanBeRetrievedWithActiveStatus() throws {
        let queryParams = "?status=active"
        let placeReports = try app.getResponse(to: listPlaceReportsURI + queryParams,
                                              method: .GET,
                                              headers: testingHeaders,
                                              decodeTo: [PlaceReportResponseDTO].self)

        XCTAssertNotNil(placeReports)
    }

    func testPlaceReportsCanBeRetrievedWithDeletedStatus() throws {
        let queryParams = "?status=deleted"
        let placeReports = try app.getResponse(to: listPlaceReportsURI + queryParams,
                                              method: .GET,
                                              headers: testingHeaders,
                                              decodeTo: [PlaceReportResponseDTO].self)

        XCTAssertNotNil(placeReports)
    }

    func testPlaceReportCanBeSavedAndRetrived() throws {
        let newReport = PlaceReportRequestDTO(senderEmail: "\(String.random(length: 8))@test.com",
                                              reportText: String.random(length: 30))

        _ = try app.sendRequest(to: reportPlaceURI,
                                method: .POST,
                                headers: testingHeaders,
                                body: newReport)

        let placeReports = try app.getResponse(to: listPlaceReportsURI,
                                               method: .GET,
                                               headers: testingHeaders,
                                               decodeTo: [PlaceReportResponseDTO].self)

        let matchingResults = placeReports.filter { $0.isEqual(to: newReport) }

        XCTAssertEqual(matchingResults.count, 1)
    }
}

// MARK: Error test cases
extension PlaceReportTests {
    func testPlaceReportsCannotBeRetrievedWithoutApiKey() throws {
        let error = try app.getResponse(to: listPlaceReportsURI,
                                        method: .GET,
                                        headers: [:],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
    }

    func testPlaceReportsCannotBeRetrievedWitInvalidApiKey() throws {
        let error = try app.getResponse(to: listPlaceReportsURI,
                                        method: .GET,
                                        headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"],
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid Api-Key!")
    }

    func testPlaceReportsCannotBeRetrievedWithInvalidStatusParam() throws {
        let queryParams = "?lang=hu&status=invalid"
        let error = try app.getResponse(to: listPlaceReportsURI + queryParams,
                                        method: .GET,
                                        headers: testingHeaders,
                                        decodeTo: GeneralErrorDTO.self)

        XCTAssertEqual(error.reason, "Invalid `status` parameter.")
    }

    func testPlaceReportCannotBeSavedWithInvalidFields() throws {
        let newReport = PlaceReportRequestDTO(senderEmail: String.random(length: 5),
                                              reportText: String.random(length: 5))

        let response = try app.sendRequest(to: reportPlaceURI,
                                method: .POST,
                                headers: testingHeaders,
                                body: newReport)

        _ = try response.content.decode(GeneralErrorDTO.self).map { error in
            XCTAssertEqual(error.reason, "'senderEmail' is not a valid email address and 'senderEmail' is not nil,"
                + " 'reportText' is less than required minimum of 10 characters")
        }
    }
}


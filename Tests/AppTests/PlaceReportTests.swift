//
//  PlaceReportTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 03. 19..
//

@testable import App
import XCTVapor

final class PlaceReportTests: XCTVaporTests {
    // MARK: Properties
    private let reportPlaceURI = "/api/v1/report_place"
    private let listPlaceReportsURI = "/api/v1/place_reports"
}

// MARK: Happy case tests
extension PlaceReportTests {
    func testPlaceReportsCanBeRetrieved() throws {
        try app.test(.GET, listPlaceReportsURI, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceReportResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlaceReportsCanBeRetrievedWithActiveStatus() throws {
        let queryParams = "?status=active"

        try app.test(.GET, listPlaceReportsURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceReportResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlaceReportsCanBeRetrievedWithDeletedStatus() throws {
        let queryParams = "?status=deleted"

        try app.test(.GET, listPlaceReportsURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceReportResponseDTO].self)

            XCTAssertNotNil(result)
        })
    }

    func testPlaceReportCanBeSavedAndRetrived() throws {
        let newReport = PlaceReportRequestDTO(
            placeId: UUID().uuidString,
            placeName: String.random(length: 15),
            senderEmail: "\(String.random(length: 8))@test.com",
            reportText: String.random(length: 30)
        )

        try app.test(.POST, reportPlaceURI, headers: testingHeaders, beforeRequest: { request in
            try request.content.encode(newReport)
        }, afterResponse: { res in
            let responseModel = try res.content.decode(GeneralSuccessDTO.self)
            XCTAssertEqual(responseModel.status, .created)
            XCTAssertEqual(responseModel.message, "Place report is created!")
        })

        try app.test(.GET, listPlaceReportsURI, headers: testingHeaders, afterResponse:  { response in
            let result = try response.content.decode([PlaceReportResponseDTO].self)
            let matchingResults = result.filter { $0.isEqual(to: newReport) }

            XCTAssertEqual(matchingResults.count, 1)
        })
    }
}

// MARK: Error case tests
extension PlaceReportTests {
    func testPlaceReportsCannotBeRetrievedWithoutApiKey() throws {
        try app.test(.GET, listPlaceReportsURI, headers: [:], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Your request did not include an API-Key!")
        })
    }

    func testPlaceReportsCannotBeRetrievedWitInvalidApiKey() throws {
        try app.test(.GET, listPlaceReportsURI, headers: ["Api-Key": "00000000-0000-0000-0000-000000000000"], afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid Api-Key!")
        })
    }

    func testPlaceReportsCannotBeRetrievedWithInvalidStatusParam() throws {
        let queryParams = "?lang=hu&status=invalid"

        try app.test(.GET, listPlaceReportsURI + queryParams, headers: testingHeaders, afterResponse:  { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "Invalid `status` parameter.")
        })
    }

    func testPlaceReportCannotBeSavedWithInvalidFields() throws {
        let newReport = PlaceReportRequestDTO(
            placeId: UUID().uuidString,
            placeName: String.random(length: 15),
            senderEmail: String.random(length: 5),
            reportText: String.random(length: 5)
        )

        try app.test(.POST, reportPlaceURI, headers: testingHeaders, beforeRequest: { request in
            try request.content.encode(newReport)
        }, afterResponse: { response in
            let error = try response.content.decode(GeneralErrorDTO.self)

            XCTAssertEqual(error.reason, "senderEmail is not a valid email address and is not null,"
                + " reportText is less than minimum of 10 character(s)")
        })
    }
}

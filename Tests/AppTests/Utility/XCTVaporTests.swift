//
//  XCTVaporTests.swift
//  AppTests
//
//  Created by Horváth Balázs on 2020. 06. 17..
//

@testable import App
import XCTVapor

open class XCTVaporTests: XCTestCase {
    // MARK: Properties
    open var app: Application!
    open var testingHeaders: HTTPHeaders!

    // MARK: Setup/teardown
    open override func setUpWithError() throws {
        try super.setUpWithError()

        app = Application(.testing)
        testingHeaders = HTTPHeaders([
            ("Api-Key", try! EnvironmentVariable.serverApiKey.value())
        ])

        try configure(app)
    }

    open override func tearDown() {
        super.tearDown()
        app.shutdown()
    }
}

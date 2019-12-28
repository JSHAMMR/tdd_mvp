//
//  TDD_MVPUITests.swift
//  TDD_MVPUITests
//
//  Created by Gamil Ali Qaid Shamar on 28/12/2019.
//  Copyright © 2019 Jamil. All rights reserved.
//

import XCTest

class TDD_MVPUITests: XCTestCase {
    let app = XCUIApplication()
    let dynamicStubs = HTTPDynamicStubs()

     override func setUp() {
           continueAfterFailure = false
           dynamicStubs.setUp()
           app.launchEnvironment = ["BASEURL" : "http://localhost:8080", "isUITest":"true"]
           continueAfterFailure = false
           super.setUp()
       }

       override func tearDown() {
           super.tearDown()
           dynamicStubs.tearDown()
       }

//    func testExample() {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
    
   
    
}

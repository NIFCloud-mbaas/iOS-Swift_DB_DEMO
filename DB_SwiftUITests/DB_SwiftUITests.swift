//
//  DB_SwiftUITests.swift
//  DB_SwiftUITests
//
//  Created by HungNV on 4/6/21.
//  Copyright © 2021 NIFTY Corporation. All rights reserved.
//

import XCTest

class DB_SwiftUITests: XCTestCase {

    var app: XCUIApplication!
    let title = "ニフクラ mobile backend"
    let note = "上のボタンを押すとニフクラ mobile backendに{\"message\":\"Hello,NCMB!\"}が保存されます"
    let msgSuccess = "保存に成功しました。objectId:"
    let msgError = "エラーが発生しました。エラーコード:"
    
    // MARK: - Setup for UI Test
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testDBDemo() throws {
        app.launch()
        XCTAssert(app.staticTexts[title].exists)
        XCTAssert(app.staticTexts[note].exists)
        let btnStart = app.buttons["btnStart"]
        XCTAssert(btnStart.exists)
        btnStart.tap()
        let tfResult = app.textFields["tfResult"]
        if tfResult.waitForExistence(timeout: 10), let value = tfResult.value as? String {
            XCTAssertTrue(value.contains(msgSuccess))
            XCTAssertFalse(value.contains(msgError))
        }
    }
}

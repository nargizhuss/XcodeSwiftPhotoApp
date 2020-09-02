//
//  XcodePhotoAppUITests.swift
//  XcodePhotoAppUITests
//
//  Created by Nargiz on 9/2/20.
//  Copyright © 2020 nargizhus. All rights reserved.
//

import XCTest


class XcodePhotoAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application
        XCUIApplication().launch()
    }
    
    override func tearDown() {
               // Put teardown code here. This method is called after the invocation of each test method in the class.
           }

    
    func testValidLoginSuccess() {
        
        let validPassword = "qwerty"
        let validEmail = "nargizhus@test.com"
        
   
        let app = XCUIApplication()
    
        app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Sign in with email"]/*[[".buttons[\"Sign in with email\"].staticTexts[\"Sign in with email\"]",".staticTexts[\"Sign in with email\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Enter your email"]/*[[".cells[\"EmailCellAccessibilityID\"].textFields[\"Enter your email\"]",".textFields[\"Enter your email\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let emailTextField = app.navigationBars["Enter your email"]
       
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()

        emailTextField.typeText(validEmail)
            
        let nextButton = app/*@START_MENU_TOKEN@*/.buttons["NextButtonAccessibilityID"]/*[[".buttons[\"Next\"]",".buttons[\"NextButtonAccessibilityID\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nextButton.tap()
        
        tablesQuery.secureTextFields["Enter your password"].tap()
        let securePasswordField = app.navigationBars["Sign in"]
        
        XCTAssertTrue(securePasswordField.exists)
        securePasswordField.typeText(validPassword)
        app.buttons["Sign in"].tap()
        
    }
        
        func testInvalidLogin() {
            
            let validPassword = "invalidPassword"
            let validEmail = "invalidEmail"
            
            
            let app = XCUIApplication()
            
                app/*@START_MENU_TOKEN@*/.staticTexts["Login"]/*[[".buttons[\"Login\"].staticTexts[\"Login\"]",".staticTexts[\"Login\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Sign in with email"]/*[[".buttons[\"Sign in with email\"].staticTexts[\"Sign in with email\"]",".staticTexts[\"Sign in with email\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
                
            let tablesQuery = app.tables
                tablesQuery/*@START_MENU_TOKEN@*/.textFields["Enter your email"]/*[[".cells[\"EmailCellAccessibilityID\"].textFields[\"Enter your email\"]",".textFields[\"Enter your email\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            let emailTextField = app.navigationBars["Enter your email"]
               
                XCTAssertTrue(emailTextField.exists)
                emailTextField.tap()

                emailTextField.typeText(validEmail)
                    
            let nextButton = app/*@START_MENU_TOKEN@*/.buttons["NextButtonAccessibilityID"]/*[[".buttons[\"Next\"]",".buttons[\"NextButtonAccessibilityID\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                nextButton.tap()
                
                tablesQuery.secureTextFields["Enter your password"].tap()
            let securePasswordField = app.navigationBars["Sign in"]
                
                XCTAssertTrue(securePasswordField.exists)
                securePasswordField.typeText(validPassword)
                app.buttons["Sign in"].tap()
            
        
        }
       
     
    }
   
       




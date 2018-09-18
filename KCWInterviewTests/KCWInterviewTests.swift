//
//  KCWInterviewTests.swift
//  KCWInterviewTests
//
//  Created by Kerry Washington on 8/29/18.
//  Copyright © 2018 kerrywashington. All rights reserved.
//

import XCTest
@testable import KCWInterview

class KCWInterviewTests: XCTestCase {
    
    var controllerUnderTest : SelectionViewController!
    override func setUp() {
        super.setUp()
     
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.controllerUnderTest = storyboard.instantiateViewController(withIdentifier: "SelectionViewController") as! SelectionViewController
        
        self.controllerUnderTest.loadView()
        self.controllerUnderTest.viewDidLoad()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(controllerUnderTest.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(controllerUnderTest.tableView.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(controllerUnderTest.tableView.dataSource)
    }
    

    
}

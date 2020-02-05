//
//  JumboTests.swift
//  JumboTests
//
//  Created by Lotanna Igwe-Odunze on 1/31/20.
//  Copyright © 2020 Lotanna Odunze. All rights reserved.
//

import XCTest
@testable import Jumbo

class JumboTests: XCTestCase {
    
    var vc: OperationsView!
    var vm: OperationsViewModel!
    var cell: OperationCell!
    var testIndex: IndexPath!

    override func setUp() {
        super.setUp()
        
        vc = OperationsView()
        vm = OperationsViewModel()
        cell = OperationCell()
        testIndex = IndexPath(row: 0, section: 0)
        
        vc.operationTable.register(OperationCell.self, forCellReuseIdentifier: vc.cellIdentifier)
        vc.viewWillAppear(true)
        cell = vc.tableView(vc.operationTable, cellForRowAt: testIndex) as? OperationCell
    }

    override func tearDown() {
        super.tearDown()
        
        vc = nil
        vm = nil
        cell = nil
        testIndex = nil
    }
    
    func testDataState() { //Successful JS call and data received.
        vc.addOperation()
        
        XCTAssertNotNil(vm.operations)
    }
    
    func testRandomiser() { //Test that each random id is different.
        let firstID = vm.randomise()
        let secondID = vm.randomise()
        
        XCTAssertNotEqual(firstID, secondID)
    }
    
    func testTableview() { //Test that it creates the tableview.
        XCTAssertNotNil(vc.operationTable)
        
        //Test that it loads the correct number of rows.
        XCTAssertEqual(vc.operationTable.numberOfRows(inSection: 0), vm.operations.count)
    }
    
    func testTableCell() { //Test that it creates the custom cell.
        XCTAssertNotNil(cell)
    }
}

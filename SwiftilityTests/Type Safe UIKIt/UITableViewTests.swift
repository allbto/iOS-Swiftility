//
//  UITableViewTests.swift
//  Swiftility
//
//  Created by Allan Barbato on 1/31/16.
//  Copyright © 2016 Allan Barbato. All rights reserved.
//

import XCTest
@testable import Swiftility

class UITableViewTests: XCTestCase
{
    func testDefaultHeight()
    {
        XCTAssert(UITableViewCell.DefaultHeight > 0, "UITableViewCell.DefaultHeight should be greater than 0")
    }
    
    func testDequeueCell()
    {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.register(TestCell.self)
        
        XCTAssert(true, "registerCell should not crash")
        
        // Dequeue cell that doesn't exists

        expectFatalError("Dequeue cell that doesn't exists") {
            _ = tableView.dequeueReusableCell() as TestNonExistingCell
        }
        
        // Dequeue cell that exists

        _ = tableView.dequeueReusableCell() as TestCell
        XCTAssert(true, "dequeueReusableCell should not crash")
        
        // Register and dequeue class cell (non nib)
        
        tableView.register(TestCellClass.self)
        
        _ = tableView.dequeueReusableCell() as TestCellClass
        
        XCTAssert(true, "dequeueReusableCell should not crash")
    }

    func testDequeueCellOnViewController()
    {
        let tableVC = TestTableVC.instantiateFromStoryboard()
        
        XCTAssert(true, "tableVC instatiation should not crash")
        
        // Dequeue cell that doesn't exists

        expectFatalError("Dequeue cell that doesn't exists") {
            _ = tableVC.tableView.dequeueReusableCell() as TestNonExistingCell
        }

        // Dequeue cell that exists

        _ = tableVC.tableView.dequeueReusableCell() as TestCell
        XCTAssert(true, "dequeueReusableCell should not crash")
        
        // Dequeue cell that doesn't exists forIndexPath
        
        expectFatalError("Dequeue cell that doesn't exists") {
            _ = tableVC.tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0)) as TestNonExistingCell
        }
        
        // Dequeue cell that exists forIndexPath
        
        _ = tableVC.tableView.dequeueReusableCell(for: IndexPath(row: 0, section: 0)) as TestCell
        XCTAssert(true, "dequeueReusableCell should not crash")
    }
}
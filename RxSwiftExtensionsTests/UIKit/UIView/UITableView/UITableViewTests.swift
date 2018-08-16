//
//  UITableViewTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 8. 17..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwiftExtensions

class UITableViewTests: XCTestCase {
    let tableView = UITableView()
    
    override func setUp() {
        super.setUp()
        
        tableView.dataSource = self
    }
    
    func testRegisterCellAndDequeue() {
        tableView.register(cell: TestTableViewCell.self)
        
        let cell = tableView.dequeue(TestTableViewCell.self, indexPath: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let text = cell?.label.text
        XCTAssertEqual(text, "Loaded")
    }
    
    func testRegisterNibCellAndDequeue() {
        tableView.register(nibCell: TestTableViewCell.self)
        
        let cell = tableView.dequeue(TestTableViewCell.self, indexPath: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let text = cell?.label.text
        XCTAssertEqual(text, "NibLoaded")
    }
    
    func testRegisterHeaderFooterAndDequeue() {
        tableView.register(cell: TestTableViewHeaderFooterView.self)
        
        let cell = tableView.dequeue(TestTableViewHeaderFooterView.self)
        XCTAssertNotNil(cell)
        
        let text = cell?.label.text
        XCTAssertEqual(text, "Loaded")
    }
    
    func testRegisterNibHeaderFooterAndDequeue() {
        tableView.register(nibCell: TestTableViewHeaderFooterView.self)
        
        let cell = tableView.dequeue(TestTableViewHeaderFooterView.self)
        XCTAssertNotNil(cell)
        
        let text = cell?.label.text
        XCTAssertEqual(text, "NibLoaded")
    }
}

extension UITableViewTests: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeue(TestTableViewCell.self, indexPath: indexPath) {
            return cell
        }
        return UITableViewCell()
    }
}

//
//  SectionDataTypeTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 8. 17..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwiftExtensions

fileprivate class SectionDataTypeTestsCollectionCell: UICollectionViewCell {
    let label = UILabel()
}

fileprivate class SectionDataTypeTestsTableCell: UITableViewCell {
    let label = UILabel()
}

class SectionDataTypeTests: XCTestCase {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let tableView = UITableView()
    
    fileprivate let sections: [TestSectionData] = [
        .section1,
        .section2([
            .string("String 0"),
            .int(1),
            .int(2),
            .string("String 2")
        ])
    ]
    
    override func setUp() {
        super.setUp()
        
        collectionView.register(cell: SectionDataTypeTestsCollectionCell.self)
        collectionView.dataSource = self
        
        tableView.register(cell: SectionDataTypeTestsTableCell.self)
        tableView.dataSource = self
    }
    
    func testCollectionView() {
        var cell = collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) as? SectionDataTypeTestsCollectionCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "String : Section 1")
        
        cell = collectionView(collectionView, cellForItemAt: IndexPath(row: 0, section: 1)) as? SectionDataTypeTestsCollectionCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "String : String 0")
        
        cell = collectionView(collectionView, cellForItemAt: IndexPath(row: 1, section: 1)) as? SectionDataTypeTestsCollectionCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "Int : 1")
        
        cell = collectionView(collectionView, cellForItemAt: IndexPath(row: 2, section: 1)) as? SectionDataTypeTestsCollectionCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "Int : 2")
        
        cell = collectionView(collectionView, cellForItemAt: IndexPath(row: 3, section: 1)) as? SectionDataTypeTestsCollectionCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "String : String 2")
    }
    
    func testTableView() {
        var cell = tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? SectionDataTypeTestsTableCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "String : Section 1")
        
        cell = tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 1)) as? SectionDataTypeTestsTableCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "String : String 0")
        
        cell = tableView(tableView, cellForRowAt: IndexPath(row: 1, section: 1)) as? SectionDataTypeTestsTableCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "Int : 1")
        
        cell = tableView(tableView, cellForRowAt: IndexPath(row: 2, section: 1)) as? SectionDataTypeTestsTableCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "Int : 2")
        
        cell = tableView(tableView, cellForRowAt: IndexPath(row: 3, section: 1)) as? SectionDataTypeTestsTableCell
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell!.label.text == "String : String 2")
    }
}

extension SectionDataTypeTests: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        switch item {
        case let .int(value):
            if let cell = collectionView.dequeue(SectionDataTypeTestsCollectionCell.self, for: indexPath) {
                cell.label.text = "Int : \(value)"
                return cell
            }
        case let .string(value):
            if let cell = collectionView.dequeue(SectionDataTypeTestsCollectionCell.self, for: indexPath) {
                cell.label.text = "String : \(value)"
                return cell
            }
        }
        return UICollectionViewCell()
    }
}

extension SectionDataTypeTests: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        switch item {
        case let .int(value):
            if let cell = tableView.dequeue(SectionDataTypeTestsTableCell.self, indexPath: indexPath) {
                cell.label.text = "Int : \(value)"
                return cell
            }
        case let .string(value):
            if let cell = tableView.dequeue(SectionDataTypeTestsTableCell.self, indexPath: indexPath) {
                cell.label.text = "String : \(value)"
                return cell
            }
        }
        return UITableViewCell()
    }
}

fileprivate enum TestSectionData {
    case section1
    case section2([Value])
}

extension TestSectionData: SectionDataType {
    
    typealias Item = Value
    
    var items: [TestSectionData.Value] {
        switch self {
        case .section1: return [.string("Section 1")]
        case let .section2(value): return value
        }
    }
    
    enum Value {
        case string(String)
        case int(Int)
    }
}

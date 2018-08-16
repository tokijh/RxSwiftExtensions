//
//  UICollectionViewTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 8. 16..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwiftExtensions

class UICollectionTests: XCTestCase {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func setUp() {
        super.setUp()
        
        collectionView.dataSource = self
    }
    
    func testRegisterCellAndDequeue() {
        collectionView.register(cell: TestCollectionViewCell.self)
        
        let cell = collectionView.dequeue(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let text = cell?.label.text
        XCTAssertEqual(text, "Loaded")
    }
    
    func testRegisterNibCellAndDequeue() {
        collectionView.register(nibCell: TestCollectionViewCell.self)
        
        let cell = collectionView.dequeue(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let text = cell?.label.text
        XCTAssertEqual(text, "NibLoaded")
    }
    
    func testRegisterHeaderCellAndDequeue() {
        collectionView.register(cell: TestCollectionViewCell.self)
        collectionView.register(cell: TestReusableCollectionViewCell.self, forSupplementaryViewOfKind: .header)
        
        let cell = collectionView.dequeue(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let header = collectionView.dequeue(TestReusableCollectionViewCell.self, ofKind: .header, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(header)
        
        let text = header?.label.text
        XCTAssertEqual(text, "Loaded")
    }
    
    func testRegisterFooterCellAndDequeue() {
        collectionView.register(cell: TestCollectionViewCell.self)
        collectionView.register(cell: TestReusableCollectionViewCell.self, forSupplementaryViewOfKind: .footer)
        
        let cell = collectionView.dequeue(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let footer = collectionView.dequeue(TestReusableCollectionViewCell.self, ofKind: .footer, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(footer)
        
        let text = footer?.label.text
        XCTAssertEqual(text, "Loaded")
    }
    
    func testRegisterNibHeaderCellAndDequeue() {
        collectionView.register(cell: TestCollectionViewCell.self)
        collectionView.register(nibCell: TestReusableCollectionViewCell.self, forSupplementaryViewOfKind: .header)
        
        let cell = collectionView.dequeue(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let header = collectionView.dequeue(TestReusableCollectionViewCell.self, ofKind: .header, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(header)
        
        let text = header?.label.text
        XCTAssertEqual(text, "NibLoaded")
    }
    
    func testRegisterNibFooterCellAndDequeue() {
        collectionView.register(cell: TestCollectionViewCell.self)
        collectionView.register(nibCell: TestReusableCollectionViewCell.self, forSupplementaryViewOfKind: .footer)
        
        let cell = collectionView.dequeue(TestCollectionViewCell.self, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(cell)
        
        let footer = collectionView.dequeue(TestReusableCollectionViewCell.self, ofKind: .footer, for: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(footer)
        
        let text = footer?.label.text
        XCTAssertEqual(text, "NibLoaded")
    }
}

extension UICollectionTests: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeue(TestCollectionViewCell.self, for: indexPath) {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let cell = collectionView.dequeue(TestReusableCollectionViewCell.self, ofKind: kind, for: indexPath) {
            return cell
        }
        return UICollectionReusableView()
    }
}

//
//  UIScrollViewTests.swift
//  RxSwiftExtensionsTests
//
//  Created by  Joonghyun-Yoon on 2018. 8. 16..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxSwiftExtensions

class UIScrollViewTests: XCTestCase {
    func testContentSize() {
        let view = UIScrollView()
        
        var latest: CGSize? = nil
        var newSize: CGSize? = nil
        
        let disposable = view.rx.contentSize.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == CGSize.zero)
        
        newSize = CGSize(width: 10, height: 9280)
        view.contentSize = newSize!
        XCTAssertEqual(latest!, newSize!)
        
        newSize = CGSize(width: 100, height: 900)
        view.contentSize = newSize!
        XCTAssertEqual(latest!, newSize!)
        
        disposable.dispose()
        
        let preSize = newSize
        newSize = CGSize(width: 10, height: 10)
        view.contentSize = newSize!
        XCTAssertEqual(latest!, preSize!)
    }
    
    func testScrollableVertical() {
        let view = UIScrollView()
        
        var latest: Bool? = nil
        
        let disposable = view.rx.scrollableVertical.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 1000)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == true)
        
        view.contentSize = CGSize(width: 100, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 10)
        XCTAssertTrue(latest == true)
        
        view.contentSize = CGSize(width: 100, height: 0)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 0)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 1000, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 10, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 0, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 0, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 900, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 280, height: 10)
        XCTAssertTrue(latest == true)
        
        disposable.dispose()
        
        view.contentSize = CGSize(width: 100, height: 10)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == true)
    }
    
    func testScrollableHorizontal() {
        let view = UIScrollView()
        
        var latest: Bool? = nil
        
        let disposable = view.rx.scrollableHorizontal.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 1000)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 10)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 100, height: 0)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 0)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 1000, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == true)
        
        view.contentSize = CGSize(width: 100, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 10, height: 100)
        XCTAssertTrue(latest == true)
        
        view.contentSize = CGSize(width: 0, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 0, height: 100)
        XCTAssertTrue(latest == false)
        
        view.contentSize = CGSize(width: 900, height: 100)
        view.bounds = CGRect(x: 0, y: 0, width: 280, height: 10)
        XCTAssertTrue(latest == true)
        
        disposable.dispose()
        
        view.contentSize = CGSize(width: 100, height: 10)
        view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        XCTAssertTrue(latest == true)
    }
}

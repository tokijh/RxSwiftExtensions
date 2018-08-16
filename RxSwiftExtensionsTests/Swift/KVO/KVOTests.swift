//
//  KVOTests.swift
//  RxSwiftExtensionsTests
//
//  Created by  Joonghyun-Yoon on 2018. 8. 16..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxSwiftExtensions

class KVOTests: XCTestCase {
    
    func testObserveNew() {
        let testClass = TestClass()
        
        let os = testClass.rx.observe(keyPath: \.value, options: [.new])
        
        var latest: String?
        let disposable = os.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == nil)
        
        testClass.value = "1"
        XCTAssertEqual(latest!, "1")
        
        testClass.value = "2"
        XCTAssertEqual(latest!, "2")
        
        testClass.value = "1"
        XCTAssertEqual(latest!, "1")
        
        testClass.value = nil
        XCTAssertTrue(latest == nil)
        
        testClass.value = "10"
        XCTAssertEqual(latest!, "10")
        
        disposable.dispose()
        
        testClass.value = "0"
        XCTAssertEqual(latest!, "10")
    }
    
    func testObserveNewAndInital() {
        let testClass = TestClass()
        
        let os = testClass.rx.observe(keyPath: \.value, options: [.initial, .new])
        
        var latest: String?
        let disposable = os.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == "0")
        
        testClass.value = "1"
        XCTAssertEqual(latest!, "1")
        
        testClass.value = "2"
        XCTAssertEqual(latest!, "2")
        
        testClass.value = "1"
        XCTAssertEqual(latest!, "1")
        
        testClass.value = nil
        XCTAssertTrue(latest == nil)

        testClass.value = "10"
        XCTAssertEqual(latest!, "10")

        disposable.dispose()

        testClass.value = "0"
        XCTAssertEqual(latest!, "10")
    }
    
    func testDefault() {
        let testClass = TestClass()
        
        let os = testClass.rx.observe(keyPath: \.value)
        
        var latest: String?
        let disposable = os.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == "0")
        
        testClass.value = "1"
        
        XCTAssertEqual(latest!, "1")
        
        testClass.value = "2"
        
        XCTAssertEqual(latest!, "2")
        
        testClass.value = nil
        
        XCTAssertTrue(latest == nil)
        
        testClass.value = "3"
        
        XCTAssertEqual(latest!, "3")
        
        disposable.dispose()
        
        testClass.value = "4"
        
        XCTAssertEqual(latest!, "3")
    }
}

fileprivate class TestClass: NSObject {
    @objc dynamic var value: String? = "0"
}

//
//  UIViewTests.swift
//  RxSwiftExtensionsTests
//
//  Created by  Joonghyun-Yoon on 2018. 8. 16..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxSwiftExtensions

class UIViewTests: XCTestCase {
    func testBounds() {
        let view = UIView()
        
        var latest: CGRect? = nil
        var newRect: CGRect? = nil
        
        let disposable = view.rx.bounds.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == CGRect.zero)
        
        newRect = CGRect(x: 0, y: 0, width: 10, height: 10)
        view.bounds = newRect!
        XCTAssertEqual(latest!, newRect!)
        
        newRect = CGRect(x: 1000, y: 200, width: 10, height: 10)
        view.bounds = newRect!
        XCTAssertEqual(latest!, newRect!)
        
        disposable.dispose()
        
        let preRect = newRect
        newRect = CGRect(x: 0, y: 0, width: 10, height: 10)
        view.bounds = newRect!
        XCTAssertEqual(latest!, preRect!)
    }
    
    func testCenter() {
        let view = UIView()
        
        var latest: CGPoint? = nil
        var newPoint: CGPoint? = nil
        
        let disposable = view.rx.center.subscribe(onNext: { latest = $0 })
        
        XCTAssertTrue(latest == CGPoint.zero)
        
        newPoint = CGPoint(x: 20, y: 80)
        view.center = newPoint!
        XCTAssertEqual(latest!, newPoint!)
        
        newPoint = CGPoint(x: 1000, y: 200)
        view.center = newPoint!
        XCTAssertEqual(latest!, newPoint!)
        
        disposable.dispose()
        
        let prePoint = newPoint
        newPoint = CGPoint(x: 0, y: 0)
        view.center = newPoint!
        XCTAssertEqual(latest!, prePoint!)
    }
}

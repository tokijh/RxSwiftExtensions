//
//  UITextViewTests.swift
//  RxSwiftExtensionsTests
//
//  Created by  Joonghyun-Yoon on 2018. 8. 16..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxSwiftExtensions

class UITextViewTests: XCTestCase {
    func testTextColor() {
        let label = UILabel()
        
        let textColor = BehaviorRelay<UIColor?>(value: nil)
        let disposable = textColor.bind(to: label.rx.textColor)
        
        var latest: UIColor? = nil
        
        textColor.accept(latest)
        XCTAssertTrue(latest != label.textColor)
        XCTAssertTrue(UIColor.black == label.textColor)
        
        latest = UIColor.blue
        textColor.accept(latest)
        XCTAssertEqual(latest, label.textColor)
        
        latest = UIColor.black
        textColor.accept(latest)
        XCTAssertEqual(latest, label.textColor)
        
        latest = UIColor.white
        textColor.accept(latest)
        XCTAssertEqual(latest, label.textColor)
        
        disposable.dispose()
        
        latest = UIColor.red
        textColor.accept(latest)
        XCTAssertEqual(UIColor.white, label.textColor)
    }
}

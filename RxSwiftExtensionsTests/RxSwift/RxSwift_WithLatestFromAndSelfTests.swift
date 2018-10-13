//
//  RxSwift_WithLatestFromAndSelfTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 10. 12..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift

class RxSwift_WithLatestFromAndSelfTests: XCTestCase {
    func testWithLatestFromAndSelf() {
        let source1 = PublishSubject<Int>()
        let source2 = Observable.just(10)
        
        var latest: Int = 0
        let disposable = source1
            .withLatestFromAndSelf(source2)
            .map({ $0 + $1 })
            .subscribe(onNext: { latest = $0 })
        
        source1.onNext(1)
        XCTAssertEqual(latest, 11)
        
        source1.onNext(12)
        XCTAssertEqual(latest, 22)
        
        source1.onNext(40)
        XCTAssertEqual(latest, 50)
    }
}

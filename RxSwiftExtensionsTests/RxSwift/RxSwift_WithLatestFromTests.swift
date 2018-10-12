//
//  RxSwift_WithLatestFromTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 10. 12..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift

class RxSwift_WithLatestFromTests: XCTestCase {
    func testWithLatestFrom() {
        let fire = PublishSubject<Void>()
        
        var latest: String = ""
        var disposable = fire
            .withLatestFrom(Observable.just("A"), Observable.just("B"))
            .map({ $0 + $1 })
            .subscribe(onNext: { latest = $0 })
        fire.onNext(())
        XCTAssertEqual(latest, "AB")
        
        disposable = fire
            .withLatestFrom(Observable.just("A"), Observable.just("B"), Observable.just("C"))
            .map({ $0 + $1 + $2 })
            .subscribe(onNext: { latest = $0 })
        fire.onNext(())
        XCTAssertEqual(latest, "ABC")
    }
}

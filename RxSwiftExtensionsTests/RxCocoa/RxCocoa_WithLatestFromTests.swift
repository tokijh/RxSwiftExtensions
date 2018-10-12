//
//  RxCocoa_WithLatestFromTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 10. 12..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

class RxCocoa_WithLatestFromTests: XCTestCase {
    func testWithLatestFrom() {
        let fire = PublishSubject<Void>()
        
        var latest: String = ""
        var disposable = fire
            .asDriver(onErrorJustReturn: ())
            .withLatestFrom(Driver.just("A"), Driver.just("B"))
            .map({ $0 + $1 })
            .drive(onNext: { latest = $0 })
        fire.onNext(())
        XCTAssertEqual(latest, "AB")
        
        disposable = fire
            .asDriver(onErrorJustReturn: ())
            .withLatestFrom(Driver.just("A"), Driver.just("B"), Driver.just("C"))
            .map({ $0 + $1 + $2 })
            .drive(onNext: { latest = $0 })
        fire.onNext(())
        XCTAssertEqual(latest, "ABC")
    }
}

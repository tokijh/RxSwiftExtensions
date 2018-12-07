//
//  RxCocoa_BinderTests.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 22/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa

class RxCocoa_BinderTests: XCTestCase { }

// Define common functions
extension RxCocoa_BinderTests {
    func createAppendedArray<T>(result: Array<T>, value: T) -> Array<T> {
        var result = result
        result.append(value)
        return result
    }
    
    func createMatchCount<T: Equatable>(with: T) -> (Int, T) -> Int {
        return { result, value in
            if value == with {
                return result + 1
            } else {
                return result
            }
        }
    }
    
    fileprivate func setTowParamsHandler<F, S>(second: S, handler: @escaping (F, S) -> ()) -> ((F) -> ()) {
        return { first in
            handler(first, second)
        }
    }
    
    fileprivate func subscribAndHandleOnNextOnIndex<S: Subscribable>(handler: @escaping (S.T, Int) -> Void, disposebag: DisposeBag) -> (((Int, S)) throws -> Void) {
        return { (arg) in
            let (index, observer) = arg
            observer.subscribe(onNext: self.setTowParamsHandler(second: index, handler: handler), onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposebag)
        }
    }
    
    fileprivate func subscribAndHandleOnNextOnIndex<S: Subscribable>(handler: @escaping (S.T, Int) -> Void, disposebag: DisposeBag) -> (((Int, S?)) throws -> Void) {
        return { (arg) in
            let (index, observer) = arg
            observer?.subscribe(onNext: self.setTowParamsHandler(second: index, handler: handler), onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposebag)
        }
    }
    
    fileprivate func subscribAndHandleOnNext<S: Subscribable>(subscribable: S?, handler: @escaping (S.T) -> Void, disposebag: DisposeBag) {
        subscribable?.subscribe(onNext: handler, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposebag)
    }
    
    fileprivate func subscribAndHandleOnNext<S: Subscribable>(subscribable: S?, handler: @escaping (S.T?) -> Void, disposebag: DisposeBag) {
        subscribable?.subscribe(onNext: handler, onError: nil, onCompleted: nil, onDisposed: nil).disposed(by: disposebag)
    }
}

// Bind ObservableType extensions
extension RxCocoa_BinderTests {
    func testBindObserverTypes() {
        let `case`: String = "Hi there"
        let observerCount: Int = 10
        let observers: [PublishSubject<String>] = repeatElement({ PublishSubject<String>() }, count: observerCount)
            .map({ $0() })
            .reduce([], createAppendedArray)
        let collectCount: Int = observers.count
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers.count).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindObserverTypesWithOptionalElement() {
        let `case`: String = "Hi there"
        let observerCount: Int = 10
        let observers: [PublishSubject<String?>] = repeatElement({ PublishSubject<String?>() }, count: observerCount)
            .map({ $0() })
            .reduce([], createAppendedArray)
        let collectCount: Int = observers.count
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers.count).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 ?? "" }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalObserverTypes() {
        let `case`: String = "Hi there"
        let observers: [PublishSubject<String>]? = nil
        let collectCount: Int = 0
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers?.count ?? 0).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers?.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalObserverTypesWithOptionalElement() {
        let `case`: String = "Hi there"
        let observers: [PublishSubject<String?>]? = nil
        let collectCount: Int = 0
        
        // Define for tests
        let publisher = PublishSubject<String?>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers?.count ?? 0).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers?.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 ?? "" }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalObserverType() {
        let `case`: String = "Hi there"
        let observer: PublishSubject<String>? = nil
        let collectValue: String = `case`
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValue: String = ""
        
        // Bind for prepare
        subscribAndHandleOnNext(subscribable: observer, handler: { observerValue = $0 }, disposebag: disposeBag)
        
        // Test
        let disposable = publisher.bind(to: observer)
        
        publisher.onNext(`case`)
        XCTAssert(observerValue != collectValue)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalObserverTypeWithOptionalElement() {
        let `case`: String = "Hi there"
        let observer: PublishSubject<String?>? = nil
        let collectValue: String = `case`
        
        // Define for tests
        let publisher = PublishSubject<String?>()
        let disposeBag = DisposeBag()
        var observerValue: String = ""
        
        // Bind for prepare
        subscribAndHandleOnNext(subscribable: observer, handler: { observerValue = $0 ?? "" }, disposebag: disposeBag)
        
        // Test
        let disposable = publisher.bind(to: observer)
        
        publisher.onNext(`case`)
        XCTAssert(observerValue != collectValue)
        
        // End test
        disposable.dispose()
    }
}

// Bind BehaviorRelay extensions
extension RxCocoa_BinderTests {
    func testBindBehaviorRelaies() {
        let `case`: String = "Hi there"
        let observerCount: Int = 10
        let observers: [BehaviorRelay<String>] = repeatElement({ BehaviorRelay<String>(value: "") }, count: observerCount)
            .map({ $0() })
            .reduce([], createAppendedArray)
        let collectCount: Int = observers.count
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers.count).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindBehaviorRelaiesWithOptionalElement() {
        let `case`: String = "Hi there"
        let observerCount: Int = 10
        let observers: [BehaviorRelay<String?>] = repeatElement({ BehaviorRelay<String?>(value: nil) }, count: observerCount)
            .map({ $0() })
            .reduce([], createAppendedArray)
        let collectCount: Int = observers.count
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers.count).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 ?? "" }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalBehaviorRelaies() {
        let `case`: String = "Hi there"
        let observers: [BehaviorRelay<String>]? = nil
        let collectCount: Int = 0
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers?.count ?? 0).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers?.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalBehaviorRelaiesWithOptionalElement() {
        let `case`: String = "Hi there"
        let observers: [BehaviorRelay<String?>]? = nil
        let collectCount: Int = 0
        
        // Define for tests
        let publisher = PublishSubject<String?>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers?.count ?? 0).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers?.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 ?? "" }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalBehaviorRelay() {
        let `case`: String = "Hi there"
        let observer: BehaviorRelay<String>? = nil
        let collectValue: String = `case`
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValue: String = ""
        
        // Bind for prepare
        subscribAndHandleOnNext(subscribable: observer, handler: { observerValue = $0 }, disposebag: disposeBag)
        
        // Test
        let disposable = publisher.bind(to: observer)
        
        publisher.onNext(`case`)
        XCTAssert(observerValue != collectValue)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalBehaviorRelayWithOptionalElement() {
        let `case`: String = "Hi there"
        let observer: BehaviorRelay<String?>? = nil
        let collectValue: String = `case`
        
        // Define for tests
        let publisher = PublishSubject<String?>()
        let disposeBag = DisposeBag()
        var observerValue: String = ""
        
        // Bind for prepare
        subscribAndHandleOnNext(subscribable: observer, handler: { observerValue = $0 ?? "" }, disposebag: disposeBag)
        
        // Test
        let disposable = publisher.bind(to: observer)
        
        publisher.onNext(`case`)
        XCTAssert(observerValue != collectValue)
        
        // End test
        disposable.dispose()
    }
}

// Bind PublishRelay extensions
extension RxCocoa_BinderTests {
    func testBindPublishRelaies() {
        let `case`: String = "Hi there"
        let observerCount: Int = 10
        let observers: [PublishRelay<String>] = repeatElement({ PublishRelay<String>() }, count: observerCount)
            .map({ $0() })
            .reduce([], createAppendedArray)
        let collectCount: Int = observers.count
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers.count).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindPublishRelaiesWithOptionalElement() {
        let `case`: String = "Hi there"
        let observerCount: Int = 10
        let observers: [PublishRelay<String?>] = repeatElement({ PublishRelay<String?>() }, count: observerCount)
            .map({ $0() })
            .reduce([], createAppendedArray)
        let collectCount: Int = observers.count
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers.count).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 ?? "" }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalPublishRelaies() {
        let `case`: String = "Hi there"
        let observers: [PublishRelay<String>]? = nil
        let collectCount: Int = 0
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers?.count ?? 0).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers?.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalPublishRelaiesWithOptionalElement() {
        let `case`: String = "Hi there"
        let observers: [PublishRelay<String?>]? = nil
        let collectCount: Int = 0
        
        // Define for tests
        let publisher = PublishSubject<String?>()
        let disposeBag = DisposeBag()
        var observerValues: [String] = repeatElement(String(), count: observers?.count ?? 0).reduce([], createAppendedArray)
        
        // Bind for prepare
        try? observers?.enumerated().forEach(subscribAndHandleOnNextOnIndex(handler: { observerValues[$1] = $0 ?? "" }, disposebag: disposeBag))
        
        // Test
        let disposable = publisher.bind(to: observers)
        
        publisher.onNext(`case`)
        let matchedCount = observerValues.reduce(0, createMatchCount(with: `case`))
        XCTAssert(matchedCount == collectCount)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalPublishRelay() {
        let `case`: String = "Hi there"
        let observer: PublishRelay<String>? = nil
        let collectValue: String = `case`
        
        // Define for tests
        let publisher = PublishSubject<String>()
        let disposeBag = DisposeBag()
        var observerValue: String = ""
        
        // Bind for prepare
        subscribAndHandleOnNext(subscribable: observer, handler: { observerValue = $0 }, disposebag: disposeBag)
        
        // Test
        let disposable = publisher.bind(to: observer)
        
        publisher.onNext(`case`)
        XCTAssert(observerValue != collectValue)
        
        // End test
        disposable.dispose()
    }
    
    func testBindOptionalPublishRelayWithOptionalElement() {
        let `case`: String = "Hi there"
        let observer: PublishRelay<String?>? = nil
        let collectValue: String = `case`
        
        // Define for tests
        let publisher = PublishSubject<String?>()
        let disposeBag = DisposeBag()
        var observerValue: String = ""
        
        // Bind for prepare
        subscribAndHandleOnNext(subscribable: observer, handler: { observerValue = $0 ?? "" }, disposebag: disposeBag)
        
        // Test
        let disposable = publisher.bind(to: observer)
        
        publisher.onNext(`case`)
        XCTAssert(observerValue != collectValue)
        
        // End test
        disposable.dispose()
    }
}

extension PublishSubject: Subscribable { }

extension BehaviorRelay: Subscribable { }

extension PublishRelay: Subscribable { }

fileprivate protocol Subscribable {
    associatedtype T
    func subscribe(onNext: ((T) -> Void)?, onError: ((Error) -> Void)?, onCompleted: (() -> Void)?, onDisposed: (() -> Void)?) -> Disposable
}

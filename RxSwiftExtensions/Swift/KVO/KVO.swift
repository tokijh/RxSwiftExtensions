//
//  KVO.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

#if !os(Linux)

import Foundation.NSObject
import RxSwift
import RxCocoa

extension Reactive where Base: NSObject {
    public func observe<Value>(keyPath: KeyPath<Base, Value?>, options: KeyValueObservingOptions = [.new, .initial], retainSelf: Bool = true) -> Observable<Value?> {
        guard let keyPathString = keyPath._kvcKeyPathString else {
            return Observable.error(RxCocoaError.invalidObjectOnKeyPath(object: base, sourceObject: keyPath, propertyName: base.description))
        }
        return self.observe(Value.self, keyPathString, options: options, retainSelf: retainSelf)
    }
    
    public func observe<Value>(keyPath: KeyPath<Base, Value>, options: KeyValueObservingOptions = [.new, .initial], retainSelf: Bool = true) -> Observable<Value?> {
        guard let keyPathString = keyPath._kvcKeyPathString else {
            return Observable.error(RxCocoaError.invalidObjectOnKeyPath(object: base, sourceObject: keyPath, propertyName: base.description))
        }
        return self.observe(Value.self, keyPathString, options: options, retainSelf: retainSelf)
    }
}

#if !DISABLE_SWIZZLING && !os(Linux)
extension Reactive where Base: NSObject {
    public func observeWeakly<Value>(keyPath: KeyPath<Base, Value?>, options: KeyValueObservingOptions = [.new, .initial]) -> Observable<Value?> {
        guard let keyPathString = keyPath._kvcKeyPathString else {
            return Observable.error(RxCocoaError.invalidObjectOnKeyPath(object: base, sourceObject: keyPath, propertyName: base.description))
        }
        return self.observeWeakly(Value.self, keyPathString, options: options)
    }
    
    public func observeWeakly<Value>(keyPath: KeyPath<Base, Value>, options: KeyValueObservingOptions = [.new, .initial]) -> Observable<Value?> {
        guard let keyPathString = keyPath._kvcKeyPathString else {
            return Observable.error(RxCocoaError.invalidObjectOnKeyPath(object: base, sourceObject: keyPath, propertyName: base.description))
        }
        return self.observeWeakly(Value.self, keyPathString, options: options)
    }
}

#endif

#endif

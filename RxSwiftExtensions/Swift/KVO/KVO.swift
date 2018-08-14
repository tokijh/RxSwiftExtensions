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
    public func observe<Value>(keyPath: KeyPath<Base, Value>, options: KeyValueObservingOptions = [.new, .initial], retainSelf: Bool = true) -> Observable<Value?> {
        return self.observe(Value.self, keyPath._kvcKeyPathString!, options: options, retainSelf: retainSelf)
    }
}

#if !DISABLE_SWIZZLING && !os(Linux)
extension Reactive where Base: NSObject {
    public func observeWeakly<Value>(keyPath: KeyPath<Base, Value>, options: KeyValueObservingOptions = [.new, .initial]) -> Observable<Value?> {
        return self.observeWeakly(Value.self, keyPath._kvcKeyPathString!, options: options)
    }
}

#endif

#endif

//
//  RxCocoa_Binder.swift
//  RxSwiftExtensions
//
//  Created by 윤중현 on 22/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import RxSwift
import RxCocoa

extension ObservableType {
    public func bind<O: ObserverType>(to observers: [O]) -> Disposable where O.E == E {
        let shared = self.share()
        let disposables = observers.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
    public func bind<O: ObserverType>(to observers: [O]) -> Disposable where O.E == E? {
        let shared = self.share()
        let disposables = observers.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
    public func bind(to relaies: [PublishRelay<E>]) -> Disposable {
        let shared = self.share()
        let disposables = relaies.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
    public func bind(to relaies: [BehaviorRelay<E?>]) -> Disposable {
        let shared = self.share()
        let disposables = relaies.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
    public func bind(to relaies: [BehaviorRelay<E>]) -> Disposable {
        let shared = self.share()
        let disposables = relaies.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
    
    public func bind(to relaies: [PublishRelay<E?>]) -> Disposable {
        let shared = self.share()
        let disposables = relaies.map({ shared.bind(to: $0) })
        return Disposables.create(disposables)
    }
}

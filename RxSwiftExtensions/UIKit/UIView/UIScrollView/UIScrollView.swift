//
//  UIScrollView.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

extension Reactive where Base: UIScrollView {
    public var contentSize: Observable<CGSize> {
        return self.observeWeakly(keyPath: \.contentSize, options: [.initial, .new]).filterNil()
    }
    
    public var scrollableVertical: Observable<Bool> {
        return self.contentSize
            .withLatestFrom(self.bounds) { (contentSize, bounds) -> Bool in
                bounds.height < contentSize.height
            }
    }
    
    public var scrollableHorizontal: Observable<Bool> {
        return self.contentSize
            .withLatestFrom(self.bounds) { (contentSize, bounds) -> Bool in
                bounds.width < contentSize.width
            }
    }
}

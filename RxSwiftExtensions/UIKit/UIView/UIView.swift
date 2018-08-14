//
//  UIView.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

extension Reactive where Base: UIView {
    var bounds: Observable<CGRect> {
        return self.observeWeakly(keyPath: \.bounds, options: [.initial, .new]).filterNil()
    }
    
    var center: Observable<CGPoint> {
        return self.observeWeakly(keyPath: \.center, options: [.initial, .new]).filterNil()
    }
}

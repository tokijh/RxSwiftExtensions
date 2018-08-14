//
//  UILabel.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UILabel {
    var textColor: Binder<UIColor?> {
        return Binder(base, binding: { (base, color) in
            base.textColor = color
        })
    }
}

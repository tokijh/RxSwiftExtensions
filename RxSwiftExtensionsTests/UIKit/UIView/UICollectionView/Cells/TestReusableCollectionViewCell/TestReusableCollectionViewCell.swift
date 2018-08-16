//
//  TestReusableCollectionViewCell.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 8. 17..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

class TestReusableCollectionViewCell: UICollectionReusableView {
    
    var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromFrameInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromCoderInit()
    }
    
    private func setupFromFrameInit() {
        label.text = "Loaded"
    }
    
    private func setupFromCoderInit() {
        label.text = "NibLoaded"
    }
}

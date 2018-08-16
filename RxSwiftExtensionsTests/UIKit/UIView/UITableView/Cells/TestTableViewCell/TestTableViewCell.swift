//
//  TestTableViewCell.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 8. 17..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    var label: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFromStyleInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromCoderInit()
    }
    
    private func setupFromStyleInit() {
        label.text = "Loaded"
    }
    
    private func setupFromCoderInit() {
        label.text = "NibLoaded"
    }
}

//
//  TestTableViewHeaderFooterView.swift
//  RxSwiftExtensionsTests
//
//  Created by 윤중현 on 2018. 8. 17..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

class TestTableViewHeaderFooterView: UITableViewHeaderFooterView {

    var label: UILabel = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupFromReuseIdentifierInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupFromCoderInit()
    }
    
    private func setupFromReuseIdentifierInit() {
        label.text = "Loaded"
    }
    
    private func setupFromCoderInit() {
        label.text = "NibLoaded"
    }
}

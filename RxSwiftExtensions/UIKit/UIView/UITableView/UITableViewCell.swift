//
//  UITableViewCell.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

extension UITableViewCell: TableViewCellType {
    static var Identifier: String { return String(describing: self.self) }
}

//
//  UITableView.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

extension UITableView {
    func register<Cell>(cell: Cell.Type, forCellReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewCell {
        register(cell, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func register<Cell>(nibCell: Cell.Type, forCellReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewCell {
        register(UINib(nibName: nibCell.Identifier, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
    
    func register<Cell>(cell: Cell.Type, forHeaderFooterViewReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewHeaderFooterView {
        register(cell, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    func register<Cell>(nibCell: Cell.Type, forHeaderFooterViewReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewHeaderFooterView {
        register(UINib(nibName: nibCell.Identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell? where Cell: UITableViewCell {
        return dequeueReusableCell(withIdentifier: reusableCell.Identifier) as? Cell
    }
    
    func dequeue<Cell>(_ resusableCell: Cell.Type, indexPath: IndexPath) -> Cell? where Cell: UITableViewCell {
        return dequeueReusableCell(withIdentifier: resusableCell.Identifier, for: indexPath) as? Cell
    }
    
    func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell? where Cell: UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: reusableCell.Identifier) as? Cell
    }
}

//
//  UITableView.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UITableView {
    public func register<Cell>(cell: Cell.Type, forCellReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewCell {
        register(cell, forCellReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nib: UINib, forCellReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewCell {
        register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nibName: String = Cell.Identifier, bundle: Bundle? = Bundle(for: Cell.classForCoder()), forCellReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewCell {
        register(nibCell: nibCell, nib: UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(cell: Cell.Type, forHeaderFooterViewReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewHeaderFooterView {
        register(cell, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nib: UINib, forHeaderFooterViewReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewHeaderFooterView {
        register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nibName: String = Cell.Identifier, bundle: Bundle? = Bundle(for: Cell.classForCoder()), forHeaderFooterViewReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UITableViewHeaderFooterView {
        register(UINib(nibName: nibName, bundle: bundle), forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    public func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell? where Cell: UITableViewCell {
        return dequeueReusableCell(withIdentifier: reusableCell.Identifier) as? Cell
    }
    
    public func dequeue<Cell>(_ resusableCell: Cell.Type, indexPath: IndexPath) -> Cell? where Cell: UITableViewCell {
        return dequeueReusableCell(withIdentifier: resusableCell.Identifier, for: indexPath) as? Cell
    }
    
    public func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell? where Cell: UITableViewHeaderFooterView {
        return dequeueReusableHeaderFooterView(withIdentifier: reusableCell.Identifier) as? Cell
    }
}

extension Reactive where Base: UITableView {
    public func items<S: Sequence, Cell: UITableViewCell, O : ObservableType>
        (cell: Cell.Type = Cell.self)
        -> (_ source: O)
        -> (_ configureCell: @escaping (Int, S.Iterator.Element, Cell) -> Void)
        -> Disposable
        where O.E == S {
            return self.items(cellIdentifier: cell.Identifier, cellType: cell)
    }
}

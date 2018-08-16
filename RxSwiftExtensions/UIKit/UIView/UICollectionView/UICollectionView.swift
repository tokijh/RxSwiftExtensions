//
//  UICollectionView.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

extension UICollectionView {
    public func register<Cell>(cell: Cell.Type, forCellWithReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionViewCell {
        register(cell, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, forCellWithReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionViewCell {
        register(UINib(nibName: nibCell.Identifier, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(cell: Cell.Type, forSupplementaryViewOfKind kind: String, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(cell, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, forSupplementaryViewOfKind kind: String, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(UINib(nibName: nibCell.Identifier, bundle: nil), forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }
    
    public func dequeue<Cell>(_ reuseableCell: Cell.Type, for indexPath: IndexPath) -> Cell? where Cell: UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: reuseableCell.Identifier, for: indexPath) as? Cell
    }
    
    public func dequeue<Cell>(_ reuseableCell: Cell.Type, ofKind kind: String, for indexPath: IndexPath) -> Cell? where Cell: UICollectionReusableView {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseableCell.Identifier, for: indexPath) as? Cell
    }
}

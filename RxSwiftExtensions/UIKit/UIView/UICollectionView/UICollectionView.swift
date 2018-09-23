//
//  UICollectionView.swift
//  RxSwiftExtensions
//
//  Created by tokijh on 2018. 8. 14..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import UIKit

public enum SupplementaryViewOfKind: String {
    case header, footer
    
    public init?(rawValue: String) {
        switch rawValue {
        case UICollectionView.elementKindSectionHeader: self = .header
        case UICollectionView.elementKindSectionFooter: self = .footer
        default: return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .header: return UICollectionView.elementKindSectionHeader
        case .footer: return UICollectionView.elementKindSectionFooter
        }
    }
}

extension UICollectionView {
    public func register<Cell>(cell: Cell.Type, forCellWithReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionViewCell {
        register(cell, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nib: UINib, forCellWithReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionViewCell {
        register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nibName: String = Cell.Identifier, bundle: Bundle? = Bundle(for: Cell.classForCoder()), forCellWithReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionViewCell {
        register(UINib(nibName: nibName, bundle: bundle), forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(cell: Cell.Type, forSupplementaryViewOfKind kind: String, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(cell, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(cell: Cell.Type, forSupplementaryViewOfKind kind: SupplementaryViewOfKind, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(cell: cell, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nib: UINib, forSupplementaryViewOfKind kind: String, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nib: UINib, forSupplementaryViewOfKind kind: SupplementaryViewOfKind, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(nibCell: nibCell, nib: nib, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nibName: String = Cell.Identifier, bundle: Bundle? = Bundle(for: Cell.classForCoder()), forSupplementaryViewOfKind kind: String, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(nibCell: nibCell, nib: UINib(nibName: nibName, bundle: bundle), forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }
    
    public func register<Cell>(nibCell: Cell.Type, nibName: String = Cell.Identifier, bundle: Bundle? = Bundle(for: Cell.classForCoder()), forSupplementaryViewOfKind kind: SupplementaryViewOfKind, withReuseIdentifier reuseIdentifier: String = Cell.Identifier) where Cell: UICollectionReusableView {
        register(nibCell: nibCell, nibName: nibName, bundle: bundle, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: reuseIdentifier)
    }
    
    public func dequeue<Cell>(_ reuseableCell: Cell.Type, for indexPath: IndexPath) -> Cell? where Cell: UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: reuseableCell.Identifier, for: indexPath) as? Cell
    }
    
    public func dequeue<Cell>(_ reuseableCell: Cell.Type, ofKind kind: String, withReuseIdentifier reuseIdentifier: String = Cell.Identifier, for indexPath: IndexPath) -> Cell? where Cell: UICollectionReusableView {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath) as? Cell
    }
    
    public func dequeue<Cell>(_ reuseableCell: Cell.Type, ofKind kind: SupplementaryViewOfKind, withReuseIdentifier reuseIdentifier: String = Cell.Identifier, for indexPath: IndexPath) -> Cell? where Cell: UICollectionReusableView {
        return dequeue(reuseableCell, ofKind: kind.rawValue, withReuseIdentifier: reuseIdentifier, for: indexPath)
    }
}

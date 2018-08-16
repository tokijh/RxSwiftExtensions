//
//  SectionDataType.swift
//  RxSwiftExtensions
//
//  Created by 윤중현 on 2018. 8. 16..
//  Copyright © 2018년 tokijh. All rights reserved.
//

public protocol SecionDataType {
    associatedtype Item
    
    var items: [Item] { get }
}

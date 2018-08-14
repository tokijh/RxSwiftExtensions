# RxSwiftExtensions

[![Swift 4.2](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://swift.org)

Frequently used extensoins in RxSwift

## Functions
- Swift
  - KVO
    - [x] `observe(keyPath: KeyPath)`
    - [x] `observeWeakly(keyPath: KeyPath)`
- UIKit
  - UIView
    - [x] `bounds: Observable<CGRect>`
    - [x] `center: Observable<CGPoint>`
  - UILabel
    - [x] `textColor: Observable<UIColor?>`
  - UITextView
    - [x] `textColor: Observable<UIColor?>`
  - UIScrollView
    - [x] `contentSize: Observable<CGSize>`
    - [x] `scrollableVertical: Observable<Bool>`
    - [x] `scrollableHorizontal: Observable<Bool>`
  - UITableView
    - [x] `register(cell: UITableViewCell.self)`
    - [x] `register(nibCell: UITableViewCell.self)`
    - [x] `register(cell: UITableViewHeaderFooterView.self)`
    - [x] `register(nibCell: UITableViewHeaderFooterView.self)`
    - [x] `dequeue(UITableViewCell.self, indexPath: IndexPath)`
    - [x] `dequeue(UITableViewHeaderFooterView.self, indexPath: IndexPath)`
    - UITableViewCell
        - [x] `Identifier: String`
    - UITableViewHeaderFooterView
        - [x] `Identifier: String`
  - UICollectionView
    - [x] `register(cell: UICollectionViewCell.self)`
    - [x] `register(nibCell: UICollectionViewCell.self)`
    - [x] `register(cell: UICollectionReusableView.self, forSupplementaryViewOfKind kind: String)`
    - [x] `register(nibCell: UICollectionReusableView.self, forSupplementaryViewOfKind kind: String)`
    - [x] `dequeue(UICollectionViewCell.self, for indexPath: IndexPath)`
    - [x] `dequeue(UICollectionViewCell.self, ofKind kind: String, for indexPath: IndexPath)`
    - UICollectionReusableView
        - [x] `Identifier: String`

## Author
[tokijh](https://github.com/tokijh)

## License
RxSwiftExtensions is available under the MIT License See the [LICENSE](LICENSE) file for more info.


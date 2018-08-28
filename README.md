# RxSwiftExtensions

[![Swift 4.2](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://swift.org)
[![Version](https://img.shields.io/cocoapods/v/RxSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/RxSwiftExtensions)
[![License](https://img.shields.io/cocoapods/l/RxSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/RxSwiftExtensions)
[![Platform](https://img.shields.io/cocoapods/p/RxSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/RxSwiftExtensions)

Frequently used extensoins in RxSwift

## Installation
* **Using [CocoaPods](https://cocoapods.org)**:

    ```ruby
    pod 'RxSwiftExtensions'
    ```

## Functions
- Swift
  - KVO
    - [x] `observe(keyPath: KeyPath)`
    - [x] `observeWeakly(keyPath: KeyPath)`
    - [x] `SectionDataType`
- UIKit
  - UIView
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
  - UIViewController
    - [x] `viewDidLoad(Void)`
    - [x] `viewWillAppear(Bool)`
    - [x] `viewDidAppear(Bool)`
    - [x] `viewWillDisappear(Bool)`
    - [x] `viewDidDisappear(Bool)`
    - [x] `viewWillLayoutSubviews(Void)`
    - [x] `viewDidLayoutSubviews(Void)`
    - [x] `willMoveToParentViewController(UIViewController?)`
    - [x] `didMoveToParentViewController(UIViewController?)`
    - [x] `didReceiveMemoryWarning(Void)`
    - [x] `isVisible(Bool?)`
    - [x] `isDismissing(Bool?)`


Functions
========

## Swift
## KVO
### `observe(keyPath: KeyPath) -> Observable<Value?>`

Observe [KVO](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html) by keyPath

[KVO](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html) is an Objective-C mechanism. That means that it wasn't built with type safety in mind. This project tries to solve some of the problems.

```
UIView()
  .observe(\.bounds, , options: [.initial, .new], retainSelf: true)
  .subscribe({ print($0) })
```

--------

### `observeWeakly(keyPath: KeyPath) -> Observable<Value?>`

Observe [KVO](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html) by keyPath

`rx.observeWeakly` has somewhat slower than `rx.observe` because it has to handle object deallocation in case of weak references.

```
UIView()
  .observeWeakly(\.bounds, , options: [.initial, .new], retainSelf: true)
  .subscribe({ print($0) })
```

## SectionDataType

Define Section Data easily in tableView or collectionView

Define follow

```
enum TestSectionData {
    case section1
    case section2([Value])
}

extension TestSectionData: SectionDataType {
    
    typealias Item = Value
    
    var items: [TestSectionData.Value] {
        switch self {
        case .section1: return [.string("Section 1")]
        case let .section2(value): return value
        }
    }
    
    enum Value {
        case string(String)
        case int(Int)
    }
}
```

You can use it follow

```
let section = sections[indexPath.section].items[indexPath.row]

switch section {
  case let .int(value):
    cell.set(value)
    return cell
  case let .string(value):
    cell.set(value)
    return cell
}
```

## UIKit

### UIView

#### `UIView.rx.bounds`

Observe bounds in UIView

```
UIView().rx.bounds.subscribe({ print($0) })
```

#### `UIView.rx.center`

Observe center in UIView

```
UIView().rx.center.subscribe({ print($0) })
```

--------

### UIScrollView

#### `UIScrollView.rx.contentSize`

Observe contentSize in UIScrollView

```
UIScrollView().rx.contentSize.subscribe({ print($0) })
```

#### `UIScrollView.rx.scrollableVertical`

Observe scrollable of vertical (`bounds.height < contentSize.height`) in UIScrollView

```
UIScrollView().rx.scrollableVertical.subscribe({ print($0) })
```

#### `UIScrollView.rx.scrollableHorizontal`

Observe scrollable of horizontal (`bounds.width < contentSize.width`) in UIScrollView

```
UIScrollView().rx.scrollableHorizontal.subscribe({ print($0) })
```

--------

### UILabel

#### `UILabel.rx.textColor`

Binder textColor in UILabel

```
Observable<UIColor?>.just(UIColor.white).bind(to: UILabel().rx.textColor)
```

--------

### UITextView

#### `UITextView.rx.textColor`

Binder textColor in UITextView

```
Observable<UIColor?>.just(UIColor.white).bind(to: UITextView().rx.textColor)
```

--------

### UICollectionView

#### `UICollectionView.register(cell: UICollectionViewCell.self)`

Register UICollectionViewCell easily

Following sample will be register with "Cell" (`UICollectionReusableView.Identifier`).

```
UICollectionView().register(cell: Cell.self)
```

Also you can define Identifier like follow

```
UICollectionView().register(cell: Cell.self, forCellWithReuseIdentifier: "CustomIdentifier")
```

#### `UICollectionView.register(nibCell: UICollectionViewCell.self)`

Register UICollectionViewCell using NIB easily

Following sample will be register with "Cell" (`UICollectionReusableView.Identifier`).

```
UICollectionView().register(nibCell: Cell.self)
```

Also you can define Identifier like follow

```
UICollectionView().register(nibCell: Cell.self, forCellWithReuseIdentifier: "CustomIdentifier")
```

#### `UICollectionView.register(cell: UICollectionReusableView.self, forSupplementaryViewOfKind: SupplementaryViewOfKind)`

Register UICollectionReusableView for SupplementaryViewOfKind

```
UICollectionView().register(cell: Cell.self, forSupplementaryViewOfKind: .header)

UICollectionView().register(nibCell: Cell.self, forSupplementaryViewOfKind: .footer)
```

#### `UICollectionView.dequeue(UICollectionViewCell.self, for: IndexPath)`

Dequeue UICollectionViewCell easily

Following sample will be dequeue with "Cell" (`UICollectionReusableView.Identifier`).

```
let cell: Cell? = UICollectionView.dequeue(Cell.self, for: IndexPath)
```

#### `UICollectionView.dequeue(UICollectionReusableView.self, ofKind: SupplementaryViewOfKind, for: IndexPath)`

Dequeue UICollectionReusableView for SupplementaryViewOfKind easily

```
let cell: Cell? = UICollectionView.dequeue(Cell.self, ofKind: .header, for: IndexPath)
```

--------

### UICollectionReusableView

#### `UICollectionReusableView.Identifier`

Define Identifier by class name

```
class MyCell: UICollectionReusableView {

}

MyCell.Identifier == "MyCell"
```

--------

### UITableView

#### `UITableView.register(cell: UITableViewCell.self)`

Register UITableViewCell easily

Following sample will be register with "Cell" (`UITableViewCell.Identifier`).

```
UITableView().register(cell: Cell.self)
```

Also you can define Identifier like follow

```
UITableView().register(cell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
```

#### `UITableView.register(nibCell: UITableViewCell.self)`

Register UITableViewCell using NIB easily

Following sample will be register with "Cell" (`UITableViewCell.Identifier`).

```
UITableView().register(nibCell: Cell.self)
```

Also you can define Identifier like follow

```
UITableView().register(nibCell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
```

#### `UITableView.register(cell: UITableViewHeaderFooterView.self)`

Register UITableViewHeaderFooterView easily

Following sample will be register with "Cell" (`UITableViewHeaderFooterView.Identifier`).

```
UITableView().register(cell: Cell.self)
```

Also you can define Identifier like follow

```
UITableView().register(cell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
```

#### `UITableView.register(nibCell: UITableViewHeaderFooterView.self)`

Register UITableViewCell using NIB easily

Following sample will be register with "Cell" (`UITableViewHeaderFooterView.Identifier`).

```
UITableView().register(nibCell: Cell.self)
```

Also you can define Identifier like follow

```
UITableView().register(nibCell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
```

#### `UITableView.dequeue(UITableViewCell.self)`

Dequeue UICollectionViewCell easily

Following sample will be dequeue with "Cell" (`UICollectionReusableView.Identifier`).

```
let cell: Cell? = UITableView().dequeue(Cell.self)
```

#### `UITableView.dequeue(UITableViewCell.self, indexPath: IndexPath)`

Dequeue UICollectionViewCell easily

Following sample will be dequeue with "Cell" (`UICollectionReusableView.Identifier`).

```
let cell: Cell? = UITableView().dequeue(Cell.self, indexPath: IndexPath)
```

#### `UICollectionView.dequeue(UITableViewHeaderFooterView.self)`

Dequeue UITableViewHeaderFooterView easily

```
let cell: Cell? = UITableView().dequeue(Cell.self)
```

--------

### UIViewController

#### `UIViewController.rx.viewDidLoad`

Observe when called `viewDidLoad` in UIViewController

```
UIViewController().rx.viewDidLoad.subscribe({ print($0) })
```

#### `UIViewController.rx.viewWillAppear`

Observe when called `viewWillAppear` in UIViewController

```
UIViewController().rx.viewWillAppear.subscribe({ print($0) })
```

#### `UIViewController.rx.viewDidAppear`

Observe when called `viewDidAppear` in UIViewController

```
UIViewController().rx.viewDidAppear.subscribe({ print($0) })
```

#### `UIViewController.rx.viewWillDisappear`

Observe when called `viewWillDisappear` in UIViewController

```
UIViewController().rx.viewWillDisappear.subscribe({ print($0) })
```

#### `UIViewController.rx.viewDidDisappear`

Observe when called `viewDidDisappear` in UIViewController

```
UIViewController().rx.viewDidDisappear.subscribe({ print($0) })
```

#### `UIViewController.rx.viewWillLayoutSubviews`

Observe when called `viewWillLayoutSubviews` in UIViewController

```
UIViewController().rx.viewWillLayoutSubviews.subscribe({ print($0) })
```

#### `UIViewController.rx.viewDidLayoutSubviews`

Observe when called `viewDidLayoutSubviews` in UIViewController

```
UIViewController().rx.viewDidLayoutSubviews.subscribe({ print($0) })
```

#### `UIViewController.rx.willMove(toParentViewController: UIViewController)`

Observe when called `willMove(toParentViewController: UIViewController)` in UIViewController

```
UIViewController().rx.willMove(toParentViewController: parentViewController).subscribe({ print($0) })
```

#### `UIViewController.rx.didMove(toParentViewController: UIViewController)`

Observe when called `didMove(toParentViewController: UIViewController)` in UIViewController

```
UIViewController().rx.didMove(toParentViewController: parentViewController).subscribe({ print($0) })
```

#### `UIViewController.rx.didReceiveMemoryWarning`

Observe when called `didReceiveMemoryWarning` in UIViewController

```
UIViewController().rx.didReceiveMemoryWarning.subscribe({ print($0) })
```

#### `UIViewController.rx.isVisible`

Triggered when the ViewController appearance state changes (true if the View is being displayed, false otherwise)

```
UIViewController().rx.isVisible.subscribe({ print($0) })
```

#### `UIViewController.rx.isDismissing`

Triggered when the ViewController is being dismissed

```
UIViewController().rx.isVisible.subscribe({ print($0) })
```

--------

## Used pods
* [RxSwift](https://github.com/ReactiveX/RxSwift)
* [RxCocoa](https://github.com/ReactiveX/RxSwift)
* [RxOptional](https://github.com/RxSwiftCommunity/RxOptional)
* [RxViewController](https://github.com/devxoul/RxViewController)
* [RxExpect](https://github.com/devxoul/RxExpect)

## Author
[tokijh](https://github.com/tokijh)

## License
RxSwiftExtensions is available under the MIT License See the [LICENSE](LICENSE) file for more info.


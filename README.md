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

- [Swift](#swift)
  - [KVO](#kvo)
    - [x] [`observe(keyPath: KeyPath)`](#observekeypath-keypath---observablevalue)
    - [x] [`observeWeakly(keyPath: KeyPath)`](#observeweaklykeypath-keypath---observablevalue)
    - [x] [`SectionDataType`](#sectiondatatype)
- [UIKit](#uikit)
  - [UIView](#uiview)
    - [UIView](#uiview)
      - [x] [`UIView.rx.bounds`](#uiviewrxbounds)
      - [x] [`UIView.rx.center`](#uiviewrxcenter)
    - [UILabel](#uilabel)
      - [x] [`UILabel.rx.textColor`](#uilabelrxtextcolor)
    - [UITextView](#uitextview)
      - [x] [`UITextView.rx.textColor`](#uitextviewrxtextcolor)
    - [UIScrollView](#uiscrollview)
      - [x] [`UIScrollView.rx.contentSize`](#uiscrollviewrxcontentsize)
      - [x] [`UIScrollView.rx.scrollableVertical`](#uiscrollviewrxscrollablevertical)
      - [x] [`UIScrollView.rx.scrollableHorizontal`](#uiscrollviewrxscrollablehorizontal)
    - [UITableView](#uitableview)
      - [x] [`register(cell: UITableViewCell.self)`](#uitableviewregistercell-uitableviewcellself)
      - [x] [`register(nibCell: UITableViewCell.self)`](#uitableviewregisternibcell-uitableviewcellself)
      - [x] [`register(cell: UITableViewHeaderFooterView.self)`](#uitableviewregistercell-uitableviewheaderfooterviewself)
      - [x] [`register(nibCell: UITableViewHeaderFooterView.self)`](#uitableviewregisternibcell-uitableviewheaderfooterviewself)
      - [x] [`dequeue(UITableViewCell.self)`](#uitableviewdequeueuitableviewcellself)
      - [x] [`dequeue(UITableViewCell.self, indexPath: IndexPath)`](#uitableviewdequeueuitableviewcellself-indexpath-indexpath)
      - [x] [`dequeue(UITableViewHeaderFooterView.self)`](#uitableviewdequeueuitableviewheaderfooterviewself)
      - [x] [`rx.items(Cell.self)`](#rxitemscellself)
    - [UITableViewCell](#uitableviewcell)
        - [x] [`UITableViewCell.Identifier`](#uitableviewcellidentifier)
    - [UITableViewHeaderFooterView](#uitableviewheaderfooterview)
        - [x] [`UITableViewHeaderFooterView.Identifier`](#uitableviewheaderfooterviewidentifier)
    - [UICollectionView](#uicollectionview)
      - [x] [`register(cell: UICollectionViewCell.self)`](#uicollectionviewregistercell-uicollectionviewcellself)
      - [x] [`register(nibCell: UICollectionViewCell.self)`](#uicollectionviewregisternibcell-uicollectionviewcellself)
      - [x] [`register(cell: UICollectionReusableView.self, forSupplementaryViewOfKind kind: String)`](#uicollectionviewregistercell-uicollectionreusableviewself-forsupplementaryviewofkind-supplementaryviewofkind)
      - [x] [`register(nibCell: UICollectionReusableView.self, forSupplementaryViewOfKind kind: String)`](#uicollectionviewregistercell-uicollectionreusableviewself-forsupplementaryviewofkind-supplementaryviewofkind)
      - [x] [`dequeue(UICollectionViewCell.self, for indexPath: IndexPath)`](#uicollectionviewdequeueuicollectionviewcellself-for-indexpath)
      - [x] [`dequeue(UICollectionViewCell.self, ofKind kind: String, for indexPath: IndexPath)`](#uicollectionviewdequeueuicollectionreusableviewself-ofkind-supplementaryviewofkind-for-indexpath)
      - [x] [`rx.items(Cell.self)`](#rxitemscellself-1)
    - [UICollectionReusableView](#uicollectionreusableview)
        - [x] [`UICollectionReusableView.Identifier`](#uicollectionreusableviewidentifier)
  - [UIViewController](#uiviewcontroller)
    - [x] [`UIViewController.rx.viewDidLoad`](#uiviewcontrollerrxviewdidload)
    - [x] [`UIViewController.rx.viewWillAppear`](#uiviewcontrollerrxviewwillappear)
    - [x] [`UIViewController.rx.viewDidAppear`](#uiviewcontrollerrxviewdidappear)
    - [x] [`UIViewController.rx.viewWillDisappear`](#uiviewcontrollerrxviewwilldisappear)
    - [x] [`UIViewController.rx.viewDidDisappear`](#uiviewcontrollerrxviewdiddisappear)
    - [x] [`UIViewController.rx.viewWillLayoutSubviews`](#uiviewcontrollerrxviewwilllayoutsubviews)
    - [x] [`UIViewController.rx.viewDidLayoutSubviews`](#uiviewcontrollerrxviewdidlayoutsubviews)
    - [x] [`UIViewController.rx.willMove(toParentViewController: UIViewController)`](#uiviewcontrollerrxwillmovetoparentviewcontroller-uiviewcontroller)
    - [x] [`UIViewController.rx.didMove(toParentViewController: UIViewController)`](#uiviewcontrollerrxdidmovetoparentviewcontroller-uiviewcontroller)
    - [x] [`UIViewController.rx.didReceiveMemoryWarning`](#uiviewcontrollerrxdidreceivememorywarning)
    - [x] [`UIViewController.rx.isVisible`](#uiviewcontrollerrxisvisible)
    - [x] [`UIViewController.rx.isDismissing`](#uiviewcontrollerrxisdismissing)
- [RxSwift](#rxswift)
  - [ObservableType](#observabletype)
    - [x] [`withLatestFrom(...)`](#observabletype-withlatestfrom)
    - [x] [`withLatestFromAndSelf(...)`](#observabletype-withlatestfromandself)
- [RxCocoa](#rxcocoa)
  - [SharedSequenceConvertibleType](#sharedsequenceconvertibletype)
    - [x] [`withLatestFrom(...)`](#sharedsequenceconvertibletype-withlatestfrom)
    - [x] [`withLatestFromAndSelf(...)`](#sharedsequenceconvertibletype-withlatestfromandself)


Functions Detail
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

#### `UITableView.dequeue(UITableViewHeaderFooterView.self)`

Dequeue UITableViewHeaderFooterView easily

```
let cell: Cell? = UITableView().dequeue(Cell.self)
```

#### `UITableView.rx.items(Cell.self)`

Bind items by rx

```
Observable.just(["0", "1", "2", "3"])
    .bind(to: tableView.rx.items(cell: Cell.self)) { row, item, cell in
            
    }
```

--------

### UITableViewCell

#### `UITableViewCell.Identifier`

Define Identifier by class name

```
class MyCell: UITableViewCell {

}

MyCell.Identifier == "MyCell"
```

--------

### UITableViewHeaderFooterView

#### `UITableViewHeaderFooterView.Identifier`

Define Identifier by class name

```
class MyCell: UITableViewHeaderFooterView {

}

MyCell.Identifier == "MyCell"
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

#### `UICollectionView.rx.items(Cell.self)`

Bind items by rx

```
Observable.just(["0", "1", "2", "3"])
    .bind(to: collectionView.rx.items(cell: Cell.self)) { row, item, cell in
            
    }
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

## RxSwift

### ObservableType

#### `withLatestFrom`

Extend withLatestFrom for support multi parameters

```
let a = Observable.just("A")
let b = Observable.just("B")
let c = Observable.just("C")

Observable().withLatestFrom(a, b, c)
    .subscribe(onNext: { (a, b, c) in
      ...
    })
```

#### `withLatestFromAndSelf`

Extend withLatestFromAndSelf for combining parameters with self

```
let a = Observable.just("A")
let b = Observable.just("B")
let c = Observable.just("C")

Observable().withLatestFromAndSelf(a, b, c)
    .subscribe(onNext: { (self, a, b, c) in
      ...
    })
```

--------

## RxCocoa

### SharedSequenceConvertibleType

#### `withLatestFrom`

Extend withLatestFrom for support multi parameters

```
let a = SharedSequenceConvertibleType.just("A")
let b = SharedSequenceConvertibleType.just("B")
let c = SharedSequenceConvertibleType.just("C")

SharedSequenceConvertibleType().withLatestFrom(a, b, c)
    .subscribe(onNext: { (a, b, c) in
      ...
    })
```

#### `withLatestFromAndSelf`

Extend withLatestFromAndSelf for combining parameters with self

```
let a = SharedSequenceConvertibleType.just("A")
let b = SharedSequenceConvertibleType.just("B")
let c = SharedSequenceConvertibleType.just("C")

SharedSequenceConvertibleType().withLatestFromAndSelf(a, b, c)
    .subscribe(onNext: { (self, a, b, c) in
      ...
    })
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


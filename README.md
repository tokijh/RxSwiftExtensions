# RxSwiftExtensions

[![Swift 4.2](https://img.shields.io/badge/swift-4.2-orange.svg?style=flat)](https://swift.org)
[![Version](https://img.shields.io/cocoapods/v/RxSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/RxSwiftExtensions)
[![License](https://img.shields.io/cocoapods/l/RxSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/RxSwiftExtensions)
[![Platform](https://img.shields.io/cocoapods/p/RxSwiftExtensions.svg?style=flat)](http://cocoapods.org/pods/RxSwiftExtensions)

Frequently used extensions in RxSwift

------

## Dear those who love RxSwift 
This library based on questions from [KakaoTalk open chat room](https://open.kakao.com/o/gl2YZjq).<br>
Join us if you have some questions about RxSwift or you are interested. We always welcome 😀<br>
However, this chat room us operating in South Korea. Therefore, you will need speaking Korean 🇰🇷<br>

<br>

이 라이브러리는 [카카오톡 오픈 채팅방](https://open.kakao.com/o/gl2YZjq)에서 올라온 질문을 바탕으로 만들어졌습니다.<br>
RxSwift에 관련하여 질문이 있거나 관심이 있다면 언제든지 가벼운 마음으로 참여하세요 😀<br>
이 방은 한국에서 운영되는 것이라 한국어를 필요로 할 수 있습니다... (이거 읽으실 정도면 문제없을 겁니다 😂)<br>

<br>

このライブラリーは[カカオトークオープンチャットルーム](https://open.kakao.com/o/gl2YZjq)に投稿された質問を基に作られました。<br>
RxSwiftについて質問や興味があれば、いつでも気軽に参加してください 😀<br>
このルームは韓国で営業されているものなので韓国語を必要とします 🇰🇷<br>

------

## Functions

<details> <summary>Swift</summary>

  - <details><summary>KVO</summary>

      - [x] [`observe(keyPath: KeyPath)`](#observekeypath-keypath---observablevalue)
      - [x] [`observeWeakly(keyPath: KeyPath)`](#observeweaklykeypath-keypath---observablevalue)
      - [x] [`SectionDataType`](#sectiondatatype)
  </details>
</details>
<details><summary>UIKit</summary>

  - <details><summary>UIView</summary>

      - [x] [`UIView.rx.bounds`](#uiviewrxbounds)
      - [x] [`UIView.rx.center`](#uiviewrxcenter)
    </details>
  - <details><summary>UILabel</summary>

      - [x] [`UILabel.rx.textColor`](#uilabelrxtextcolor)
    </details>
  - <details><summary>UITextView</summary>

      - [x] [`UITextView.rx.textColor`](#uitextviewrxtextcolor)
    </details>
  - <details><summary>UIScrollView</summary>

      - [x] [`UIScrollView.rx.contentSize`](#uiscrollviewrxcontentsize)
      - [x] [`UIScrollView.rx.scrollableVertical`](#uiscrollviewrxscrollablevertical)
      - [x] [`UIScrollView.rx.scrollableHorizontal`](#uiscrollviewrxscrollablehorizontal)
    </details>
  - <details><summary>UITableView</summary>

      - [x] [`register(cell: UITableViewCell.self)`](#uitableviewregistercell-uitableviewcellself)
      - [x] [`register(nibCell: UITableViewCell.self)`](#uitableviewregisternibcell-uitableviewcellself)
      - [x] [`register(cell: UITableViewHeaderFooterView.self)`](#uitableviewregistercell-uitableviewheaderfooterviewself)
      - [x] [`register(nibCell: UITableViewHeaderFooterView.self)`](#uitableviewregisternibcell-uitableviewheaderfooterviewself)
      - [x] [`dequeue(UITableViewCell.self)`](#uitableviewdequeueuitableviewcellself)
      - [x] [`dequeue(UITableViewCell.self, indexPath: IndexPath)`](#uitableviewdequeueuitableviewcellself-indexpath-indexpath)
      - [x] [`dequeue(UITableViewHeaderFooterView.self)`](#uitableviewdequeueuitableviewheaderfooterviewself)
      - [x] [`rx.items(Cell.self)`](#uitableviewrxitemscellself)

      - <details><summary>UITableViewCell</summary>

          - [x] [`UITableViewCell.Identifier`](#uitableviewcellidentifier)
        </details>
      - <details><summary>UITableViewHeaderFooterView</summary>

          - [x] [`UITableViewHeaderFooterView.Identifier`](#uitableviewheaderfooterviewidentifier)
        </details>
    </details>
  - <details><summary>UICollectionView</summary>

      - [x] [`register(cell: UICollectionViewCell.self)`](#uicollectionviewregistercell-uicollectionviewcellself)
      - [x] [`register(nibCell: UICollectionViewCell.self)`](#uicollectionviewregisternibcell-uicollectionviewcellself)
      - [x] [`register(cell: UICollectionReusableView.self, forSupplementaryViewOfKind kind: String)`](#uicollectionviewregistercell-uicollectionreusableviewself-forsupplementaryviewofkind-supplementaryviewofkind)
      - [x] [`register(nibCell: UICollectionReusableView.self, forSupplementaryViewOfKind kind: String)`](#uicollectionviewregistercell-uicollectionreusableviewself-forsupplementaryviewofkind-supplementaryviewofkind)
      - [x] [`dequeue(UICollectionViewCell.self, for indexPath: IndexPath)`](#uicollectionviewdequeueuicollectionviewcellself-for-indexpath)
      - [x] [`dequeue(UICollectionViewCell.self, ofKind kind: String, for indexPath: IndexPath)`](#uicollectionviewdequeueuicollectionreusableviewself-ofkind-supplementaryviewofkind-for-indexpath)
      - [x] [`rx.items(Cell.self)`](#uicollectionviewrxitemscellself)

      - <details><summary>UICollectionReusableView</summary>

          - [x] [`UICollectionReusableView.Identifier`](#uicollectionreusableviewidentifier)
        </details>
    </details>
  - <details><summary>UIViewController</summary>

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
  </details>
</details>
<details><summary>RxSwift</summary>

  - <details><summary>ObservableType</summary>

      - [x] [`withLatestFrom(...)`](#observabletype-withlatestfrom)
      - [x] [`withLatestFromAndSelf(...)`](#observabletype-withlatestfromandself)
      - [x] [`bind(to [ObserverType])`](#observabletype-bindto-observertype)
      - [x] [`bind(to Optional<ObserverType>)`](#observabletype-bindto-optionalobservertype)
    </details>
</details>
<details><summary>RxCocoa</summary>

- <details><summary>SharedSequenceConvertibleType</summary>

    - [x] [`withLatestFrom(...)`](#sharedsequenceconvertibletype-withlatestfrom)
    - [x] [`withLatestFromAndSelf(...)`](#sharedsequenceconvertibletype-withlatestfromandself)
  </details>
</details>


Functions Detail
========

<details><summary>Swift</summary>

  - <details><summary>KVO</summary>

    - <details><summary>observe(keyPath: KeyPath) -> Observable<Value?></summary>

      Observe [KVO](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html) by keyPath

      [KVO](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html) is an Objective-C mechanism. That means that it wasn't built with type safety in mind. This project tries to solve some of the problems.

      ```
      UIView()
        .observe(\.bounds, , options: [.initial, .new], retainSelf: true)
        .subscribe({ print($0) })
      ```
      </details>
    - <details><summary>observeWeakly(keyPath: KeyPath) -> Observable<Value?></summary>

      Observe [KVO](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueObserving/KeyValueObserving.html) by keyPath

      `rx.observeWeakly` has somewhat slower than `rx.observe` because it has to handle object deallocation in case of weak references.

      ```
      UIView()
        .observeWeakly(\.bounds, , options: [.initial, .new], retainSelf: true)
        .subscribe({ print($0) })
      ```
      </details>
    </details>
  - <details><summary>SectionDataType</summary>

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
    </details>
</details>

<details><summary>UIKit</summary>

  - <details><summary>UIView</summary>

    - <details><summary>UIView.rx.bounds</summary>

        Observe bounds in UIView

        ```
        UIView().rx.bounds.subscribe({ print($0) })
        ```
      </details>
    - <details><summary>UIView.rx.center</summary>

        Observe center in UIView

        ```
        UIView().rx.center.subscribe({ print($0) })
        ```
      </details>
    </details>
  - <details><summary>UILabel</summary>

    - <details><summary>UILabel.rx.textColor</summary>

        Binder textColor in UILabel

        ```
        Observable<UIColor?>.just(UIColor.white).bind(to: UILabel().rx.textColor)
        ```
      </details>
    </details>
  - <details><summary>UITextView</summary>

    - <details><summary>UITextView.rx.textColor</summary>

        Binder textColor in UITextView

        ```
        Observable<UIColor?>.just(UIColor.white).bind(to: UITextView().rx.textColor)
        ```
      </details>
    </details>
  - <details><summary>UIScrollView</summary>

    - <details><summary>UIScrollView.rx.contentSize</summary>

        Observe contentSize in UIScrollView

        ```
        UIScrollView().rx.contentSize.subscribe({ print($0) })
        ```
      </details>
    - <details><summary>UIScrollView.rx.scrollableVertical</summary>

        Observe scrollable of vertical (`bounds.height < contentSize.height`) in UIScrollView

        ```
        UIScrollView().rx.scrollableVertical.subscribe({ print($0) })
        ```
      </details>
    - <details><summary>UIScrollView.rx.scrollableHorizontal</summary>

        Observe scrollable of horizontal (`bounds.width < contentSize.width`) in UIScrollView

        ```
        UIScrollView().rx.scrollableHorizontal.subscribe({ print($0) })
        ```
      </details>
    </details>
  - <details><summary>UITableView</summary>

    - <details><summary>UITableView.register(cell: UITableViewCell.self)</summary>

        Register UITableViewCell easily

        Following sample will be register with "Cell" (`UITableViewCell.Identifier`).

        ```
        UITableView().register(cell: Cell.self)
        ```

        Also you can define Identifier like follow

        ```
        UITableView().register(cell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
        ```
      </details>
    - <details><summary>UITableView.register(nibCell: UITableViewCell.self)</summary>

        Register UITableViewCell using NIB easily

        Following sample will be register with "Cell" (`UITableViewCell.Identifier`).

        ```
        UITableView().register(nibCell: Cell.self)
        ```

        Also you can define Identifier like follow

        ```
        UITableView().register(nibCell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
        ```
      </details>
    - <details><summary>UITableView.register(cell: UITableViewHeaderFooterView.self)</summary>

        Register UITableViewHeaderFooterView easily

        FolloFollowing sample will be register with "Cell" (`UITableViewHeaderFooterView.Identifier`).

        ```
        UITableView().register(cell: Cell.self)
        ```

        Also you can define Identifier like follow

        ```
        UITableView().register(cell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
        ```
      </details>
    - <details><summary>UITableView.register(cell: UITableViewHeaderFooterView.self)</summary>

        Register UITableViewCell using NIB easily

        FolloFollowing sample will be register with "Cell" (`UITableViewHeaderFooterView.Identifier`).

        ```
        UITableView().register(cell: Cell.self)
        ```

        Also you can define Identifier like follow

        ```
        UITableView().register(cell: Cell.self, forCellReuseIdentifier: "CustomIdentifier")
        ```
      </details>
    - <details><summary>UITableView.dequeue(UITableViewCell.self)</summary>

        Dequeue UICollectionViewCell easily

        Following sample will be dequeue with "Cell" (`UICollectionReusableView.Identifier`).

        ```
        let cell: Cell? = UITableView().dequeue(Cell.self)
        ```
      </details>
    - <details><summary>UITableView.dequeue(UITableViewCell.self, indexPath: IndexPath)</summary>

        Dequeue UICollectionViewCell easily

        Following sample will be dequeue with "Cell" (`UICollectionReusableView.Identifier`).

        ```
        let cell: Cell? = UITableView().dequeue(Cell.self, indexPath: IndexPath)
        ```
      </details>
    - <details><summary>UITableView.dequeue(UITableViewHeaderFooterView.self)</summary>

        Dequeue UITableViewHeaderFooterView easily

        ```
        let cell: Cell? = UITableView().dequeue(Cell.self)
        ```
      </details>
    - <details><summary>UITableView.rx.items(Cell.self)</summary>

        Bind items by rx

        ```
        Observable.just(["0", "1", "2", "3"])
            .bind(to: tableView.rx.items(cell: Cell.self)) { row, item, cell in

            }
        ```
      </details>
    </details>
- <details><summary>UITableViewCell</summary>

    - <details><summary>UITableViewCell.Identifier</summary>

        Define Identifier by class name

        ```
        class MyCell: UITableViewCell {

        }

        MyCell.Identifier == "MyCell"
        ```
      </details>
    </details>
- <details><summary>UITableViewHeaderFooterView</summary>

    - <details><summary>UITableViewHeaderFooterView.Identifier</summary>

        Define Identifier by class name

        ```
        class MyCell: UITableViewHeaderFooterView {

        }

        MyCell.Identifier == "MyCell"
        ```
      </details>
    </details>
- <details><summary>UICollectionView</summary>

    - <details><summary>UICollectionView.register(cell: UICollectionViewCell.self)</summary>

        Register UICollectionViewCell easily

        Following sample will be register with "Cell" (`UICollectionReusableView.Identifier`).

        ```
        UICollectionView().register(cell: Cell.self)
        ```

        Also you can define Identifier like follow

        ```
        UICollectionView().register(cell: Cell.self, forCellWithReuseIdentifier: "CustomIdentifier")
        ```
      </details>
    - <details><summary>UICollectionView.register(nibCell: UICollectionViewCell.self)</summary>

        Register UICollectionViewCell using NIB easily

        Following sample will be register with "Cell" (`UICollectionReusableView.Identifier`).

        ```
        UICollectionView().register(nibCell: Cell.self)
        ```

        Also you can define Identifier like follow

        ```
        UICollectionView().register(nibCell: Cell.self, forCellWithReuseIdentifier: "CustomIdentifier")
        ```
      </details>
    - <details><summary>UICollectionView.register(cell: UICollectionReusableView.self, forSupplementaryViewOfKind: SupplementaryViewOfKind)</summary>

        Register UICollectionReusableView for SupplementaryViewOfKind

        ```
        UICollectionView().register(cell: Cell.self, forSupplementaryViewOfKind: .header)

        UICollectionView().register(nibCell: Cell.self, forSupplementaryViewOfKind: .footer)
        ```
      </details>
    - <details><summary>UICollectionView.dequeue(UICollectionViewCell.self, for: IndexPath)</summary>

        Dequeue UICollectionViewCell easily

        Following sample will be dequeue with "Cell" (`UICollectionReusableView.Identifier`).

        ```
        let cell: Cell? = UICollectionView.dequeue(Cell.self, for: IndexPath)
        ```
      </details>
    - <details><summary>UICollectionView.dequeue(UICollectionReusableView.self, ofKind: SupplementaryViewOfKind, for: IndexPath)</summary>

        DeDequeue UICollectionReusableView for SupplementaryViewOfKind easily

        ```
        let cell: Cell? = UICollectionView.dequeue(Cell.self, ofKind: .header, for: IndexPath)
        ```
      </details>
    - <details><summary>UICollectionView.rx.items(Cell.self)</summary>

        Bind items by rx

        ```
        Observable.just(["0", "1", "2", "3"])
            .bind(to: collectionView.rx.items(cell: Cell.self)) { row, item, cell in

            }
        ```
      </details>
    </details>
- <details><summary>UICollectionReusableView</summary>

    - <details><summary>UICollectionReusableView.Identifier</summary>

        Define Identifier by class name

        ```
        class MyCell: UICollectionReusableView {

        }

        MyCell.Identifier == "MyCell"
        ```
      </details>
  </details>
- <details><summary>UIViewController</summary>

  - <details><summary>UIViewController.rx.viewDidLoad</summary>
      Observe when called `viewDidLoad` in UIViewController

      ```
      UIViewController().rx.viewDidLoad.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.viewWillAppear</summary>
      Observe when called `viewWillAppear` in UIViewController

      ```
      UIViewController().rx.viewWillAppear.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.viewDidAppear</summary>
      Observe when called `viewDidAppear` in UIViewController

      ```
      UIViewController().rx.viewDidAppear.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.viewWillDisappear</summary>
      Observe when called `viewWillDisappear` in UIViewController

      ```
      UIViewController().rx.viewWillDisappear.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.viewDidDisappear</summary>
      Observe when called `viewDidDisappear` in UIViewController

      ```
      UIViewController().rx.viewDidDisappear.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.viewWillLayoutSubviews</summary>
      Observe when called `viewWillLayoutSubviews` in UIViewController

      ```
      UIViewController().rx.viewWillLayoutSubviews.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.viewDidLayoutSubviews</summary>
      Observe when called `viewDidLayoutSubviews` in UIViewController

      ```
      UIViewController().rx.viewDidLayoutSubviews.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.willMove(toParentViewController: UIViewController)</summary>
      Observe when called `willMove(toParentViewController: UIViewController)` in UIViewController

      ```
      UIViewController().rx.willMove(toParentViewController: parentViewController).subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.didMove(toParentViewController: UIViewController)</summary>
      Observe when called `didMove(toParentViewController: UIViewController)` in UIViewController

      ```
      UIViewController().rx.didMove(toParentViewController: parentViewController).subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.didReceiveMemoryWarning</summary>
      Observe when called `didReceiveMemoryWarning` in UIViewController

      ```
      UIViewController().rx.didReceiveMemoryWarning.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.isVisible</summary>
      Triggered when the ViewController appearance state changes (true if the View is being displayed, false otherwise)

      ```
      UIViewController().rx.isVisible.subscribe({ print($0) })
      ```
    </details>
  - <details><summary>UIViewController.rx.isDismissing</summary>
      Triggered when the ViewController is being dismissed

      ```
      UIViewController().rx.isDismissing.subscribe({ print($0) })
      ```
    </details>
  </details>
</details>
<details><summary>RxSwift</summary>

  - <details><summary>ObservableType</summary>

    - <details><summary>withLatestFrom</summary>

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
      </details>
    - <details><summary>withLatestFromAndSelf</summary>

        Extend withLatestFromAndSelf for combining parameters with self

        ```
        let a = Observable.just("A")
        let b = Observable.just("B")
        let c = Observable.just("C")

        Observable().withLatestFromAndSelf(a, b, c)
            .subscribe(onNext: { (a, b, c) in
                ...
            })
        ```
      </details>
    - <details><summary>bind(to [ObserverType?]?)</summary>

        Can bind multiple ObserverType in one line

        ```
        let publisher = PublishSubject<String>()
        
        let observers: [PublishSubject<String>] = [...]

        let disposable = publisher.bind(to: observers)
        ```
      </details>
    - <details><summary>bind(to ObserverType?)</summary>

        Can bind optional type
        if ovserver is nil, it will ignore subscribe

        ```
        let publisher = PublishSubject<String>()
        
        let observer: PublishSubject<String>? = nil

        let disposable = publisher.bind(to: observer)
        ```
      </details>
    </details>
</details>
<details><summary>RxCocoa</summary>

  - <details><summary>SharedSequenceConvertibleType</summary>

    - <details><summary>withLatestFrom</summary>

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
      </details>
    - <details><summary>withLatestFromAndSelf</summary>

        Extend withLatestFromAndSelf for combining parameters with self

        ```
        let a = SharedSequenceConvertibleType.just("A")
        let b = SharedSequenceConvertibleType.just("B")
        let c = SharedSequenceConvertibleType.just("C")

        SharedSequenceConvertibleType().withLatestFromAndSelf(a, b, c)
            .subscribe(onNext: { (a, b, c) in
                ...
            })
        ```
      </details>
    </details>
</details>

--------

## Installation
* **Using [CocoaPods](https://cocoapods.org)**:

    ```ruby
    pod 'RxSwiftExtensions'
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


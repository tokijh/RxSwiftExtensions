//
//  UIViewControllerTests.swift
//  RxSwiftExtensionsTests
//
//  Created by  tokijh
//
//  Copyright © 2017 Suyeol Jeon (xoul.kr) https://github.com/devxoul/RxViewController
//  Copyright © 2018년 tokijh. All rights reserved.
//

import XCTest
import RxSwiftExtensions
import RxExpect

class UIViewControllerTests: XCTestCase {
    func testViewDidLoad() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewDidLoad() }
        test.assert(viewController.rx.viewDidLoad) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
        }
    }
    
    func testViewWillAppear() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewWillAppear(false) }
        test.assert(viewController.rx.viewWillAppear) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
            XCTAssertEqual(events.in(100...).filter(.next).first?.value.element, false)
        }
    }
    
    func testViewDidAppear() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewDidAppear(false) }
        test.assert(viewController.rx.viewDidAppear) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
            XCTAssertEqual(events.in(100...).filter(.next).first?.value.element, false)
        }
    }
    
    func testViewWillDisappear() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewWillDisappear(false) }
        test.assert(viewController.rx.viewWillDisappear) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
            XCTAssertEqual(events.in(100...).filter(.next).first?.value.element, false)
        }
    }
    
    func testViewDidDisappear() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewDidDisappear(false) }
        test.assert(viewController.rx.viewDidDisappear) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
            XCTAssertEqual(events.in(100...).filter(.next).first?.value.element, false)
        }
    }
    
    func testViewWillLayoutSubviews() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewWillLayoutSubviews() }
        test.assert(viewController.rx.viewWillLayoutSubviews) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
        }
    }
    
    func testViewDidLayoutSubviews() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.viewDidLayoutSubviews() }
        test.assert(viewController.rx.viewDidLayoutSubviews) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
        }
    }
    
    func testWillMoveToParentViewController() {
        let test = RxExpect()
        let viewController = UIViewController()
        let parentViewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.willMove(toParent: parentViewController) }
        test.scheduler.scheduleAt(200) { viewController.willMove(toParent: nil) }
        test.assert(viewController.rx.willMoveToParentViewController) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 2)
            XCTAssertEqual(events.in(100...).filter(.next).first?.value.element ?? nil, parentViewController)
            XCTAssertEqual(events.in(200...).filter(.next).first?.value.element ?? nil, nil)
        }
    }
    
    func testDidMoveToParentViewController() {
        let test = RxExpect()
        let viewController = UIViewController()
        let parentViewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.didMove(toParent: parentViewController) }
        test.scheduler.scheduleAt(200) { viewController.didMove(toParent: nil) }
        test.assert(viewController.rx.didMoveToParentViewController) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 2)
            XCTAssertEqual(events.in(100...).filter(.next).first?.value.element ?? nil, parentViewController)
            XCTAssertEqual(events.in(200...).filter(.next).first?.value.element ?? nil, nil)
        }
    }
    
    func testDidReceiveMemoryWarning() {
        let test = RxExpect()
        let viewController = UIViewController()
        test.scheduler.scheduleAt(100) { viewController.didReceiveMemoryWarning() }
        test.assert(viewController.rx.didReceiveMemoryWarning) { events in
            XCTAssertEqual(events.in(..<100).filter(.next).count, 0)
            XCTAssertEqual(events.in(100...).filter(.next).count, 1)
        }
    }
}

//
//  RxSwift_WithLatestFromAndSelf.swift
//  RxSwiftExtensions
//
//  Created by 윤중현 on 2018. 10. 11..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxSwift

extension ObservableType {
    
    /**
     Merges two observable sequences into one observable sequence by using latest element from the second sequence every time when `self` emits an element.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter second: Second observable source.
     - returns: An observable sequence containing the result of combining each element of the self  with the latest element from the second source, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<SecondO: ObservableConvertibleType>(_ second: SecondO) -> Observable<(Self.E, SecondO.E)> {
        return self.withLatestFrom(second) { ($0, $1) }
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType>
        (_ source1: O1, _ source2: O2) -> Observable<(Self.E, O1.E, O2.E)> {
        return self.withLatestFromAndSelf(source1)
            .withLatestFromAndSelf(source2)
            .map({ ($0.0, $0.1, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, resultSelector: @escaping (Self.E, O1.E, O2.E) throws -> ResultType) -> Observable<ResultType> {
        return self.withLatestFromAndSelf(source1, source2)
            .map({ try resultSelector($0.0, $0.1, $0.2) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      O3: ObservableConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3) -> Observable<(Self.E, O1.E, O2.E, O3.E)> {
        return self.withLatestFromAndSelf(source1, source2)
            .withLatestFromAndSelf(source3)
            .map({ ($0.0, $0.1, $0.2, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      O3: ObservableConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, resultSelector: @escaping (Self.E, O1.E, O2.E, O3.E) throws -> ResultType) -> Observable<ResultType> {
        return self.withLatestFromAndSelf(source1, source2, source3)
            .map({ try resultSelector($0.0, $0.1, $0.2, $0.3) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      O3: ObservableConvertibleType,
                                      O4: ObservableConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4) -> Observable<(Self.E, O1.E, O2.E, O3.E, O4.E)> {
        return self.withLatestFromAndSelf(source1, source2, source3)
            .withLatestFromAndSelf(source4)
            .map({ ($0.0, $0.1, $0.2, $0.3, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      O3: ObservableConvertibleType,
                                      O4: ObservableConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, resultSelector: @escaping (Self.E, O1.E, O2.E, O3.E, O4.E) throws -> ResultType) -> Observable<ResultType> {
        return self.withLatestFromAndSelf(source1, source2, source3, source4)
            .map({ try resultSelector($0.0, $0.1, $0.2, $0.3, $0.4) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter source5: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      O3: ObservableConvertibleType,
                                      O4: ObservableConvertibleType,
                                      O5: ObservableConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5) -> Observable<(Self.E, O1.E, O2.E, O3.E, O4.E, O5.E)> {
        return self.withLatestFromAndSelf(source1, source2, source3, source4)
            .withLatestFromAndSelf(source5)
            .map({ ($0.0, $0.1, $0.2, $0.3, $0.4, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - seealso: [combineLatest operator on reactivex.io](http://reactivex.io/documentation/operators/combinelatest.html)
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter source5: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: ObservableConvertibleType,
                                      O2: ObservableConvertibleType,
                                      O3: ObservableConvertibleType,
                                      O4: ObservableConvertibleType,
                                      O5: ObservableConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, resultSelector: @escaping (Self.E, O1.E, O2.E, O3.E, O4.E, O5.E) throws -> ResultType) -> Observable<ResultType> {
        return self.withLatestFromAndSelf(source1, source2, source3, source4, source5)
            .map({ try resultSelector($0.0, $0.1, $0.2, $0.3, $0.4, $0.5) })
    }
}

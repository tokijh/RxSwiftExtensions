//
//  RxCocoa_WithLatestFromAndSelf.swift
//  RxSwiftExtensions
//
//  Created by 윤중현 on 2018. 10. 12..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxCocoa

extension SharedSequenceConvertibleType {
    
    /**
     Merges two observable sequences into one observable sequence by using latest element from the second sequence every time when `self` emits an element.
     
     - parameter second: Second observable source.
     - returns: An observable sequence containing the result of combining each element of the self  with the latest element from the second source, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<SecondO: SharedSequenceConvertibleType>(_ second: SecondO) -> SharedSequence<SharingStrategy, (Self.E, SecondO.E)> where SecondO.SharingStrategy == SharingStrategy {
        return self.withLatestFrom(second) { ($0, $1) }
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2) -> SharedSequence<SharingStrategy, (Self.E, O1.E, O2.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1)
                    .withLatestFromAndSelf(source2)
                    .map({ ($0.0, $0.1, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, resultSelector: @escaping (Self.E, O1.E, O2.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2)
                    .map({ resultSelector($0.0, $0.1, $0.2) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      O3: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3) -> SharedSequence<SharingStrategy, (Self.E, O1.E, O2.E, O3.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2)
                    .withLatestFromAndSelf(source3)
                    .map({ ($0.0, $0.1, $0.2, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      O3: SharedSequenceConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, resultSelector: @escaping (E, O1.E, O2.E, O3.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2, source3)
                    .map({ resultSelector($0.0, $0.1, $0.2, $0.3) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      O3: SharedSequenceConvertibleType,
                                      O4: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4) -> SharedSequence<SharingStrategy, (Self.E, O1.E, O2.E, O3.E, O4.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2, source3)
                    .withLatestFromAndSelf(source4)
                    .map({ ($0.0, $0.1, $0.2, $0.3, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      O3: SharedSequenceConvertibleType,
                                      O4: SharedSequenceConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, resultSelector: @escaping (E, O1.E, O2.E, O3.E, O4.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2, source3, source4)
                    .map({ resultSelector($0.0, $0.1, $0.2, $0.3, $0.4) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter source5: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      O3: SharedSequenceConvertibleType,
                                      O4: SharedSequenceConvertibleType,
                                      O5: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5) -> SharedSequence<SharingStrategy, (Self.E, O1.E, O2.E, O3.E, O4.E, O5.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy,
              O5.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2, source3, source4)
                    .withLatestFromAndSelf(source5)
                    .map({ ($0.0, $0.1, $0.2, $0.3, $0.4, $1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter source4: Observable source.
     - parameter source5: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFromAndSelf<O1: SharedSequenceConvertibleType,
                                      O2: SharedSequenceConvertibleType,
                                      O3: SharedSequenceConvertibleType,
                                      O4: SharedSequenceConvertibleType,
                                      O5: SharedSequenceConvertibleType,
                                      ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, resultSelector: @escaping (E, O1.E, O2.E, O3.E, O4.E, O5.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy,
              O5.SharingStrategy == SharingStrategy {
                return self.withLatestFromAndSelf(source1, source2, source3, source4, source5)
                    .map({ resultSelector($0.0, $0.1, $0.2, $0.3, $0.4, $0.5) })
    }
}

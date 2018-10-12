//
//  RxCocoa_WithLatestFrom.swift
//  RxSwiftExtensions
//
//  Created by 윤중현 on 2018. 10. 12..
//  Copyright © 2018년 tokijh. All rights reserved.
//

import RxCocoa

extension SharedSequenceConvertibleType {
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2) -> SharedSequence<SharingStrategy, (O1.E, O2.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1)
                    .withLatestFromAndSelf(source2)
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               ResultType>
        (_ source1: O1, _ source2: O2, resultSelector: @escaping (O1.E, O2.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2)
                    .map({ resultSelector($0.0, $0.1) })
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               O3: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3) -> SharedSequence<SharingStrategy, (O1.E, O2.E, O3.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2)
                    .withLatestFrom(source3) { ($0.0, $0.1, $1) }
    }
    
    /**
     Merges observable sequences into one observable sequence by combining each element from self with the latest element from the sources, if any.
     
     - parameter source1: Observable source.
     - parameter source2: Observable source.
     - parameter source3: Observable source.
     - parameter resultSelector: Function to invoke for each element from the self combined with the latest element from the second source, if any.
     - returns: An observable sequence containing the result of combining elements of the self with the latest elements from the sources, if any, using the specified result selector function.
     */
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               O3: SharedSequenceConvertibleType,
                               ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, resultSelector: @escaping (O1.E, O2.E, O3.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2, source3)
                    .map({ resultSelector($0.0, $0.1, $0.2) })
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
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               O3: SharedSequenceConvertibleType,
                               O4: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4) -> SharedSequence<SharingStrategy, (O1.E, O2.E, O3.E, O4.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2, source3)
                    .withLatestFrom(source4) { ($0.0, $0.1, $0.2, $1) }
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
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               O3: SharedSequenceConvertibleType,
                               O4: SharedSequenceConvertibleType,
                               ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2, source3, source4)
                    .map({ resultSelector($0.0, $0.1, $0.2, $0.3) })
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
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               O3: SharedSequenceConvertibleType,
                               O4: SharedSequenceConvertibleType,
                               O5: SharedSequenceConvertibleType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5) -> SharedSequence<SharingStrategy, (O1.E, O2.E, O3.E, O4.E, O5.E)>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy,
              O5.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2, source3, source4)
                    .withLatestFrom(source5) { ($0.0, $0.1, $0.2, $0.3, $1) }
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
    public func withLatestFrom<O1: SharedSequenceConvertibleType,
                               O2: SharedSequenceConvertibleType,
                               O3: SharedSequenceConvertibleType,
                               O4: SharedSequenceConvertibleType,
                               O5: SharedSequenceConvertibleType,
                               ResultType>
        (_ source1: O1, _ source2: O2, _ source3: O3, _ source4: O4, _ source5: O5, resultSelector: @escaping (O1.E, O2.E, O3.E, O4.E, O5.E) -> ResultType) -> SharedSequence<SharingStrategy, ResultType>
        where O1.SharingStrategy == SharingStrategy,
              O2.SharingStrategy == SharingStrategy,
              O3.SharingStrategy == SharingStrategy,
              O4.SharingStrategy == SharingStrategy,
              O5.SharingStrategy == SharingStrategy {
                return self.withLatestFrom(source1, source2, source3, source4, source5)
                    .map({ resultSelector($0.0, $0.1, $0.2, $0.3, $0.4) })
    }
}


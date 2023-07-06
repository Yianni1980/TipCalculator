//
//  CalculatorVM.swift
//  TipCalculator
//
//  Created by ioannis on 4/7/23.
//

import Foundation
import Combine

class CalculatorVM {
    
    struct Input {
        
        let billPublisher: AnyPublisher<Double,Never>
        let tipPublisher: AnyPublisher<Tip,Never>
        let splitPublisher:AnyPublisher<Int,Never>
        
    }
    
    
    struct Output {
        
        let updateViewPublisher: AnyPublisher<Result,Never>
        
        
    }
    private var cancellables = Set<AnyCancellable>()
    
    func  transform(input:Input) ->Output {
//        
//        input.billPublisher.sink { bill in
//            print("thebill:\(bill)")
//        }.store(in: &cancellables)
        
        
//
//        input.tipPublisher.sink { tip in
//            print("TipPercent:\(tip)")
//
//        }.store(in: &cancellables)
        
//        input.splitPublisher.sink { split in
//            print("the split:\(split)")
//        }.store(in: &cancellables)
        
        let updateViewPublisher = Publishers.CombineLatest3(
            input.billPublisher,
            input.tipPublisher,
//            input.splitPublisher.flatMap({ Intyhj in
//                <#code#>
//            })
        
        )
        
        let result = Result(
            amountPerPerson: 500,
            totalBill: 1000,
            totalTip: 50.0)
        
        return Output(updateViewPublisher: Just(result).eraseToAnyPublisher())
    }
    
    
    
}

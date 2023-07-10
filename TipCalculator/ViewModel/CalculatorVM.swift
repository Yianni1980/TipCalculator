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
        let logoViewTapPublisher:AnyPublisher<Void,Never>
        
    }
    
    
    struct Output {
        
        let updateViewPublisher: AnyPublisher<Result,Never>
        let resetCalculatorPublisher:AnyPublisher<Void,Never>
        
        
    }
    private var cancellables = Set<AnyCancellable>()
    private let audioPlayerSerrvice:AudioPlayerService
    
    init(audioPlayerService:AudioPlayerService = DefaultAudioPlayer()) {
        self.audioPlayerSerrvice = audioPlayerService
    }
    
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
            input.splitPublisher).flatMap{[unowned self] (bill,tip,split) in
                let totalTip  = getTipAmount(bill:bill, tip: tip)
                let totalBill = bill + totalTip
                let amountPerPerson = totalBill / Double(split)
                let result = Result(
                    amountPerPerson: amountPerPerson,
                    totalBill: totalBill,
                    totalTip: totalTip)
                return Just(result)
            }.eraseToAnyPublisher()
        
        let resultCalculatorPublisher = input.logoViewTapPublisher.handleEvents( receiveOutput: { [unowned self]  in
            
            audioPlayerSerrvice.playSound()
            
        }).flatMap { return Just($0) }.eraseToAnyPublisher()
        return Output(updateViewPublisher: updateViewPublisher, resetCalculatorPublisher: resultCalculatorPublisher)
    }
            
            
            
    private func getTipAmount(bill:Double,tip:Tip) ->Double {
        switch tip {
             
        case .none:
          return 0
        case .tenPercent:
            return bill * 0.1
        case .FifteenPercent:
            return bill * 0.15
        case .twenntyPercent:
            return bill * 0.20
        case .custom(value: let value):
            return Double(value)
        }
        
    }
    
    
}

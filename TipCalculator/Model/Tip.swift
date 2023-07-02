//
//  Tip.swift
//  TipCalculator
//
//  Created by ioannis on 2/7/23.
//

import Foundation
enum  Tip {
    case none
    case tenPercent
    case FifteenPercent
    case twenntyPercent
    case custom(value:Int)
    
    var stringValue:String {
        switch self {
            
        case .none:
            return  ""
        case .tenPercent:
            return  "10%"
        case .FifteenPercent:
            return  "15%"
        case .twenntyPercent:
            return  "20%"
        case .custom(value: let value):
            return String(value)
        }
    }
}

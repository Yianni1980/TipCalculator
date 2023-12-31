//
//  ThemeFont.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit

struct ThemeFont  {
    //AvenirNext
    
    static func regular(ofSize size :CGFloat)->UIFont {
        
        return UIFont(name: "AvenirNext-Regular", size: size) ?? .systemFont(ofSize: size)
        
    }
    
    static func bold(ofSize size :CGFloat)->UIFont {
        
        return UIFont(name: "AvenirNext-Bold", size: size) ?? .systemFont(ofSize: size)
        
    }
    
    static func demibold(ofSize size :CGFloat)->UIFont {
        
        return UIFont(name: "AvenirNext-DemiBold", size: size) ?? .systemFont(ofSize: size)
        
    }
}

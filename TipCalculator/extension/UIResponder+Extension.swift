//
//  UIResponder+Extension.swift
//  TipCalculator
//
//  Created by ioannis on 5/7/23.
//

import UIKit

extension UIResponder {
    var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
    
    
}

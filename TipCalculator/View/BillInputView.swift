//
//  BillInputView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit
class BillInputView:UIView {
   
    
    init() {
        super.init(frame: .zero)
        
        layout()
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .green
    }
}

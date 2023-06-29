//
//  SplitInputView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit


class SplitInputView:UIView {
   
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .purple
    }
}

//
//  TipInputView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit

class TipInputView:UIView {
   private let logoView = LogoView()
    
    init() {
        super.init(frame: .zero)
        
        layout()
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .yellow
    }
}

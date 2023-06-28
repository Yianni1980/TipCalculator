//
//  LogoView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit

class LogoView:UIView {
    
    private let ImageView: UIImageView = {
        let view  = UIImageView(image: .init(named: "icCalculatorBW"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let topLabel: UILabel = {
        let label = UILabel()
        let text = NSMutableAttributedString(
            string: "MR TIP",
            attributes: [.font:ThemeFont.demibold(ofSize: 16)])
        text.addAttributes([.font:ThemeFont.bold(ofSize: 24)], range: NSMakeRange(3, 3))
        label.attributedText = text
       return label
        
    }()
    
    private let 
    
    
    
    
    
    private lazy var hStackView:UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [
       
       ])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        
        layout()
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundColor = .red
    }
}




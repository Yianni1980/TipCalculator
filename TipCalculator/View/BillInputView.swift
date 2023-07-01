//
//  BillInputView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit
class BillInputView:UIView {
     private let headerView = {
        return HeaderView()
    }()
    
    
    private let textFieldCointainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(radius: 8.0)
        return view
    }()
    
    private let currencyDenominationLabel:UILabel = {
        let label = LabelFactory.build(text:"$", font: ThemeFont.bold(ofSize: 24))
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var textField:UITextField  = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.font = ThemeFont.demibold(ofSize: 28)
        textfield.keyboardType = .decimalPad
        textfield.setContentHuggingPriority(.defaultLow, for: .horizontal)
        textfield.tintColor = ThemeColor.text
        textfield.textColor = ThemeColor.text
        //Add Toolbar
        let toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: frame.size.width, height: 36))
        toolBar.barStyle = .default
        let donebutton = UIBarButtonItem(title: "Dobne", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil),
            donebutton
        ]
        
        toolBar.isUserInteractionEnabled = true
        textfield.inputAccessoryView = toolBar
        return textfield
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        
        layout()
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [headerView,textFieldCointainerView].forEach(addSubview(_:))
        
    }
    
    @objc private func doneButtonTapped() {
        
    }
}


class HeaderView:UIView {
    
    init() {
        super.init(frame:.zero)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func layout() {
        
        backgroundColor = .red
        
    }
    
}

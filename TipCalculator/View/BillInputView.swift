//
//  BillInputView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit
import Combine
import SnapKit
import CombineCocoa

class BillInputView:UIView {
     private let headerView = {
        let view = HeaderView()
         view.configure(topText: "Enter", bottomText: "your bill")
         
         return view
    }()
    
    
    private let textFieldContainerView: UIView = {
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
        let donebutton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil),
            donebutton
        ]
        
        toolBar.isUserInteractionEnabled = true
        textfield.inputAccessoryView = toolBar
        return textfield
    }()
    private var cancellables = Set<AnyCancellable>()
     
    private let billSubject: PassthroughSubject<Double, Never> = .init()
    var valuePublisher:AnyPublisher<Double,Never> {
        return billSubject.eraseToAnyPublisher()
    }
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        
        layout()
        observe()
    }
    
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func observe() {
        textField.textPublisher.sink { [unowned self ] text in
        billSubject.send(text?.doubleValue ?? 0)
        }.store(in: &cancellables)
        
        
    }
    
    
    private func layout() {
        [headerView,textFieldContainerView].forEach(addSubview(_:))
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(textFieldContainerView.snp.centerY)
            make.width.equalTo(68)
            make.trailing.equalTo(textFieldContainerView.snp.leading).offset(-24)
        }
        textFieldContainerView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
        }
        
        textFieldContainerView.addSubview(currencyDenominationLabel)
        textFieldContainerView.addSubview(textField)
        
        currencyDenominationLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(textFieldContainerView.snp.leading).offset(16)
        }
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(currencyDenominationLabel.snp.trailing).offset(16)
            make.trailing.equalTo(textFieldContainerView.snp.trailing).offset(-16)
        }
        
    }
    
    @objc private func doneButtonTapped() {
        textField.endEditing(true)
    }
}



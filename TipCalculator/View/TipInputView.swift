//
//  TipInputView.swift
//  TipCalculator
//
//  Created by ioannis on 28/6/23.
//

import UIKit
import SnapKit
import Combine
import CombineCocoa

class TipInputView:UIView {
    private let headerView:HeaderView = {
        let view = HeaderView()
        view.configure(topText: "Choose", bottomText: "your tip")
        return view
    }()
    
    private var cancellables = Set<AnyCancellable>()

    private lazy var tenPercentTipButton:UIButton = {
        let button = buildTipButton(tip: .tenPercent)
        button.tapPublisher.flatMap ({
            Just(Tip.tenPercent)
        }).assign(to: \.value,on:tipSubject)
            .store(in: &cancellables)
        return button
    }()
    private lazy var fifteenPercentTipButton:UIButton = {
        let button = buildTipButton(tip: .FifteenPercent)
        button.tapPublisher.flatMap ({
            Just(Tip.FifteenPercent)
        }).assign(to: \.value,on:tipSubject)
            .store(in: &cancellables)
        return button
    }()
    private lazy var twentyPercentTipButton:UIButton = {
        let button = buildTipButton(tip: .twenntyPercent)
        button.tapPublisher.flatMap ({
            Just(Tip.twenntyPercent)
        }).assign(to: \.value,on:tipSubject)
            .store(in: &cancellables)
        return button
    }()
    
    private lazy var customTipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Custom tip", for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.backgroundColor = ThemeColor.primary
        button.tintColor = .white
        button.addCornerRadius(radius: 8.0)
        return button
    }()
    
    private lazy var buttonHstackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
        tenPercentTipButton,
        fifteenPercentTipButton,
        twentyPercentTipButton,
        ])
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var buttonVstackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
       buttonHstackView,
       customTipButton
        ])
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        stackView.axis = .vertical
        return stackView
    }()
    
    private let tipSubject = CurrentValueSubject<Tip,Never>(.twenntyPercent)
     var valuePublisher :AnyPublisher<Tip,Never> {
        return tipSubject.eraseToAnyPublisher()
    }
    
    init() {
        super.init(frame: .zero)
        
        layout()
        print("tip:\(tipSubject.value)")
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {

        [headerView,buttonVstackView].forEach(addSubview(_:))
        
        buttonVstackView.snp.makeConstraints { make in
            
            make.top.bottom.trailing.equalToSuperview()
            
        }
        
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalTo(buttonVstackView.snp.leading).offset(-24)
            make.width.equalTo(68)
            make.centerY.equalTo(buttonHstackView.snp.centerY)
        }
        
        
        
    }
    
    private func buildTipButton(tip:Tip)->UIButton {
        let button = UIButton(type:.custom)
        button.backgroundColor = ThemeColor.primary
        button.addCornerRadius(radius: 8.0)
        let text = NSMutableAttributedString(
            string: tip.stringValue,
        attributes: [
            .font: ThemeFont.bold(ofSize: 20),
            .foregroundColor:UIColor.white
            ])
        text.addAttributes([
            .font:ThemeFont.demibold(ofSize: 14)
        ],range: NSMakeRange(2, 1))
        button.setAttributedTitle(text, for: .normal)
        return button
        
    }
}
 

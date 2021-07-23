//
//  ButtonView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/22.
//

import UIKit
import SnapKit

class ButtonView: UIView {
    
    let buttonHeight: CGFloat = 54
    
    static let height: CGFloat = 86
    
    lazy var demoButton: UIButton = {
        
        let button = UIButton()
        
        button.setTitle("Sign up", for: .normal)
        
        button.backgroundColor = button.tintColor
        
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = buttonHeight/2
        
        button.clipsToBounds = true
        
        button.setbackgroundColor(color: .gray, for: .disabled)
        
        button.setbackgroundColor(color: .blue, for: .normal)
        
        return button
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(demoButton)
        
        demoButton.snp.makeConstraints { make in
            
            make.height.equalTo(buttonHeight)
            
            make.top.equalToSuperview().offset(16)
            
            make.bottom.equalToSuperview().offset(-16)
            
            make.leading.trailing.equalToSuperview().inset(0)
            
        }
    }
    
}

#if DEBUG
import SwiftUI
@available(iOS 13, *)
struct ButtonView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ButtonView().showPreview()
        
    }
    
}
#endif

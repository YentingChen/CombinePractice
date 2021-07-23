//
//  PasswordView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/23.
//

import UIKit

class PasswordView: UIView {
    
    static let height: CGFloat = 86
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        
        label.numberOfLines = 1
        
        label.textColor = .darkGray
        
        label.text = "Password"
        
        return label
    }()
    
    lazy var textField: TextField = {
        
        let textField = TextField()
        
        textField.padding = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        textField.backgroundColor = .white
        
        textField.layer.borderWidth = 1
        
        textField.layer.borderColor = UIColor.black.cgColor
        
        textField.isSecureTextEntry = true
        
        return textField
        
    }()
    
    lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ titleLabel,textField])
        
        stackView.axis = .vertical
        
        stackView.alignment = .fill
        
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(vStackView)

        vStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(8)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

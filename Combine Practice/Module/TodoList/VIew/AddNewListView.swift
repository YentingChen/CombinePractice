//
//  AddNewListView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/25.
//

import UIKit

class AddNewListView: UIView {
    
    static let height: CGFloat = 100
    
    lazy var textField: TextField = {
        
        let textField = TextField()
        
        textField.borderStyle = .roundedRect
        
        return textField
    }()
    
    lazy var doneButton: UIButton = {
        
        let button = UIButton(type: .contactAdd)
        
        button.setTitleColor(.blue, for: .normal)
        
        button.setTitleColor(.gray, for: .disabled)
        
        button.titleLabel?.textAlignment = .center
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.lightGray
        
        self.addSubview(textField)
        
        self.addSubview(doneButton)
        
        textField.snp.makeConstraints { (make) in
            
            make.centerY.equalToSuperview()
         
            make.left.equalToSuperview().inset(16)
            
            make.right.equalTo(doneButton.snp.left).offset(-16)
            
            make.height.equalTo(40)
        }
        
        doneButton.snp.makeConstraints { (make) in
           
            make.centerY.equalTo(textField.snp.centerY)
            
            make.right.equalToSuperview().inset(16)

        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#if DEBUG
import SwiftUI
@available(iOS 13, *)

struct AddNewListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AddNewListView().showPreview()
        
    }
    
}
#endif

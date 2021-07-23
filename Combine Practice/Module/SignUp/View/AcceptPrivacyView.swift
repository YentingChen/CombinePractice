//
//  AcceptPrivacyView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/22.
//

import UIKit
import SnapKit

class AcceptPrivacyView: UIView {
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 16)
        
        label.numberOfLines = 1
        
        label.textColor = .darkGray
        
        label.text = "I accept the privacy policy"
        
        return label
    }()
    
    lazy var switchControl: UISwitch = {
        
        let switchControl = UISwitch()
        
        return switchControl
        
    }()
    
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,switchControl])
        
        stackView.axis = .horizontal
        
        stackView.alignment = .center
        
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        self.addSubview(hStackView)
        
        hStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

#if DEBUG
import SwiftUI

@available(iOS 13, *)

struct AcceptPrivacyView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        AcceptPrivacyView().showPreview()
    }
    
}
#endif

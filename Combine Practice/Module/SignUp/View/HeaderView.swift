//
//  HeaderView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/22.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    let imageHeight: CGFloat = 54
    
    static let height: CGFloat = 200
    
    lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "add-user")
        
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Sign UP"
        
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        
        label.numberOfLines = 1
        
        return label
    }()
    
    lazy var vStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [
            
            imageView,
            titleLabel
        ])
        
        stackView.axis = .vertical
        
        stackView.spacing = 10
        
        stackView.alignment = .center
        
        return stackView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(vStackView)
        
        imageView.snp.makeConstraints { (make) in
            
            make.width.height.equalTo(imageHeight)
        }
        
        vStackView.snp.makeConstraints({ (make) in
            
            make.centerY.centerX.equalToSuperview()

           
            
        })
        
    }
    
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HeaderView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        HeaderView().showPreview()
        
    }
    
    
}
#endif

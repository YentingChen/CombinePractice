//
//  SignUpView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/22.
//

import UIKit
import SnapKit

class SignUpView: UIView {
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView(frame: .zero)
        
        scrollView.isScrollEnabled = true
        
        return scrollView
        
    }()
    
    lazy var containerView: UIView = {
        
        let view = UIView()
        
        return view
        
    }()
    
    lazy var headerView: HeaderView = {
        
        let headerView = HeaderView(frame: .zero)
        
        return headerView
        
    }()
    
    lazy var accountView: AccountView = {
        
        let view = AccountView(frame: .zero)
        
        return view
        
    }()
    
    lazy var passwordView: PasswordView = {
        
        let view = PasswordView(frame: .zero)
        
        return view
        
    }()

    lazy var acceptTermsView: AcceptTermsView = {
        
        let view = AcceptTermsView(frame: .zero)
        
        return view
        
    }()
    
    lazy var acceptPrivacyView: AcceptPrivacyView = {
        
        let view = AcceptPrivacyView(frame: .zero)
        
        return view
        
    }()
    
    lazy var buttonView: ButtonView = {
        
        let view = ButtonView()
        
        return view
    }()
    
    lazy var vStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [
            headerView,
            accountView,
            passwordView,
            acceptTermsView,
            acceptPrivacyView,
            buttonView
        ])

        stackView.distribution = .fill
        
        stackView.axis = .vertical
        
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
        
        addSubview(scrollView)
        
        scrollView.addSubview(containerView)
        
        containerView.addSubview(vStackView)
        
        scrollView.snp.makeConstraints { (make) in
        
            make.edges.equalToSuperview()
            
        }

        containerView.snp.makeConstraints { (make) in
            
            make.top.bottom.left.right.width.equalToSuperview()
            
            make.height.equalToSuperview().multipliedBy(1.5)

        }
        
        vStackView.snp.makeConstraints { (make) in
            
            make.top.equalToSuperview().inset(20)
            
            make.left.right.equalToSuperview().inset(16)
        }
        
        headerView.snp.makeConstraints { (make) in
            
            make.height.equalTo(HeaderView.height)
        }
        
        accountView.snp.makeConstraints { (make) in
            
            make.height.equalTo(80)
        }
        
        passwordView.snp.makeConstraints { (make) in
            
            make.height.equalTo(80)
        }
        
    }
    
}

#if DEBUG
import SwiftUI
@available(iOS 13, *)
struct SignUpView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SignUpView().showPreview()
        
    }
    
}
#endif

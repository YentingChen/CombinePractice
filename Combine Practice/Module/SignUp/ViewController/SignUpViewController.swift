//
//  SignUpViewController.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/21.
//

import UIKit
import Combine
import SnapKit

class SignUpViewController: UIViewController {
    
    private var subscription: AnyCancellable?
    
    var viewModel: SignUpViewModel?
    
    // define lazy views
    lazy var signUpView: SignUpView = {
        
        let view = SignUpView()
        
        return view
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = SignUpViewModel()
       
        setupView()
        
        setupBindings()
    }
    
    func setupBindings() {
        
        subscription = viewModel?.validToSubmit.receive(on: RunLoop.main).assign(to: \.isEnabled, on: signUpView.buttonView.demoButton)
        
    }
    
    func setupView() {
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(signUpView)
        
        signUpView.snp.makeConstraints { (make) in
            
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            
            make.left.right.bottom.equalToSuperview()
            
            make.bottom.equalTo(view.snp.bottom)
            
        }
        
        signUpView.acceptTermsView.switchControl.addTarget(self, action: #selector(acceptTerms(sender:)), for: .valueChanged)
        
        signUpView.acceptPrivacyView.switchControl.addTarget(self, action: #selector(acceptPrivacy(sender:)), for: .valueChanged)
        
        signUpView.accountView.textField.addTarget(self, action: #selector(nameChanged(sender:)), for: .editingChanged)
        
        signUpView.buttonView.demoButton.addTarget(self, action: #selector(submitAction(sender:)), for: .touchUpInside)
        
    }
    
    @objc func acceptTerms(sender: UISwitch) {
        
        viewModel?.acceptedTerms = sender.isOn
        
    }

    @objc func acceptPrivacy(sender: UISwitch) {

        viewModel?.acceptedPrivacy = sender.isOn
    }

    @objc func nameChanged(sender: UITextField) {
        
        viewModel?.name = sender.text ?? ""
        
    }
    
    @objc func submitAction(sender: UIButton) {
        
        print("Submit...")
        
        self.present(TodoListViewController(), animated: false, completion: nil)

    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SignUpViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        SignUpViewController().showPreview()
    }
}
#endif

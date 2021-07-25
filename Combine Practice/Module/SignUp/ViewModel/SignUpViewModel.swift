//
//  SignUpViewModel.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/23.
//

import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var acceptedTerms: Bool = false
    
    @Published var acceptedPrivacy: Bool = false
    
    @Published var name: String = ""
    
    private var stream: AnyCancellable?
    
    var validToSubmit: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3($acceptedTerms, $acceptedPrivacy, $name)
            .map { terms, privacy, name in
                terms && privacy && !name.isBlank
            }.eraseToAnyPublisher()
    }
    
    deinit {
        
        print("\(self) deinit")
        
    }
    
}

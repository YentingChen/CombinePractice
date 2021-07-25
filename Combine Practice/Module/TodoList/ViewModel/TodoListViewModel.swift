//
//  TodoListViewModel.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/25.
//

import Combine

class TodoListViewModel {
    
    let tasks = CurrentValueSubject<[String], Never>(["test"])
    
    var validToSubmit: AnyPublisher<Bool, Never> {
        
        return $textFieldText.map{ !$0.isBlank }.eraseToAnyPublisher()
    }
    
    @Published var textFieldText: String = ""
    
    var addNewTask = PassthroughSubject<String, Never>()
    
    var subscription = Set<AnyCancellable>()
    
    init() {
        
        addNewTask.sink { [unowned self] (item) in
            
            tasks.value.append(item)
            
        }.store(in: &subscription)
        
    }
    
}

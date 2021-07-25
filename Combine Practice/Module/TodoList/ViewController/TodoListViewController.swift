//
//  TodoListViewController.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/24.
//

import UIKit
import Combine

class TodoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: TodoListViewModel? = TodoListViewModel()
    
    let todoListView = TodoListView()
    
    var subscriptions = Set<AnyCancellable>()
    
    private var subscription: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(todoListView)
        
        todoListView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            
            make.left.right.bottom.equalToSuperview()
            
        }
        
        todoListView.tableView.delegate = self
        
        todoListView.tableView.dataSource = self
        
        viewModel?.tasks.sink(receiveValue: { [unowned self] (items) in
            
            self.todoListView.tableView.reloadData()

        }).store(in: &subscriptions)
        
        todoListView.addNewListView.doneButton.addTarget(self, action: #selector(doneButtonTapped(sender:)), for: .touchUpInside)
        
        todoListView.addNewListView.textField.addTarget(self, action: #selector(textFieldChanged(sender:)), for: .editingChanged)
        
        subscription = viewModel?.validToSubmit.receive(on: RunLoop.main).assign(to: \.isEnabled, on: todoListView.addNewListView.doneButton)
        
        viewModel?.$textFieldText.filter { $0.isBlank}.compactMap{ $0 }.assign(to: \.text, on: todoListView.addNewListView.textField).store(in: &subscriptions)
    }
    
    @objc func doneButtonTapped(sender: UIButton) {
        
        guard let viewModel = viewModel else { return }
        
        viewModel.addNewTask.send(viewModel.textFieldText)
        
        viewModel.textFieldText = ""
        
    }
    
    @objc func textFieldChanged(sender: UITextField) {
        
        guard let viewModel = viewModel else { return }
        
        viewModel.textFieldText = sender.text ?? ""
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.tasks.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell()}
        
        cell.textLabel?.text = viewModel?.tasks.value[indexPath.row]
        
        return cell
    }
    
}



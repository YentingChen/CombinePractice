//
//  TodoListView.swift
//  Combine Practice
//
//  Created by Yenting Chen on 2021/7/24.
//

import UIKit
import SnapKit

class TodoListView: UIView {
    
    let addNewListView = AddNewListView()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.addSubview(addNewListView)
        
        self.addSubview(tableView)
        
        addNewListView.snp.makeConstraints { (make) in
            
            make.top.left.right.equalToSuperview()
            
            make.height.equalTo(AddNewListView.height)
        }
        
        tableView.snp.makeConstraints { (make) in
            
            make.top.equalTo(addNewListView.snp.bottom)
            
            make.left.right.bottom.equalToSuperview()
            
        }
    
    }
}

#if DEBUG
import SwiftUI
@available(iOS 13, *)

struct TodoListView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        TodoListView().showPreview()
    }
    
}
#endif

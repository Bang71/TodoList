//
//  ListViewModel.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var todos: [Todo]
    
    init() {
        self.todos = [
            Todo(title: "Todo Example", description: "Test", isComplete: false),
            Todo(title: "Todo Example2", description: "Test", isComplete: true)
            
        ]
    }
}

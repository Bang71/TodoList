//
//  ListViewModel.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    //    @Published var items = [TodoItem]()
    private var coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        
        fetchTodos()
    }
    
    private func fetchTodos() {
        coreDataStack.fetchItems(type: TodoEntity.self)?.forEach({ result in
            print(result)
        })
    }
    
//    func deleteTodo() {
//        coreDataStack.deleteItem(item: <#T##NSManagedObject#>)
//    }
//
//    func updateTodo() {
//        coreDataStack.updateItem(item: <#T##TodoEntity#>, params: <#T##[String : Any]#>)
//    }
}

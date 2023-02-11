//
//  ListViewModel.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    private var coreDataService = CoreDataService.shared
    @Published var items: [TodoEntity] = []
    
    init() {
        fetchTodos()
    }
    
    func fetchTodos() {
        items = coreDataService.fetchItems(type: TodoEntity.self)
    }
    
    func deleteTodo(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let item = items[index]
        coreDataService.deleteItem(item: item)
        fetchTodos()
    }
}

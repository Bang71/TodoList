//
//  DetailViewModel.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import Foundation

class DetailViewModel: ObservableObject {
    private var coreDataService = CoreDataService.shared
    
    func updateTodo(item: TodoEntity, title: String, memo: String, isCompleted: Bool) {
        coreDataService.updateItem(item: item,
                                   params: [
                                    "title" : title == "" ? "NONAME" : title,
                                    "memo" : memo,
                                    "isCompleted" : isCompleted
                                   ])
    }
}

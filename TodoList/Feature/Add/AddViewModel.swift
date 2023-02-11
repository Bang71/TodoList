//
//  AddViewModel.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/11.
//

import Foundation
import CoreData

class AddViewModel: ObservableObject {
    private var coreDataService = CoreDataService.shared
    
    func addTodo(title: String, memo: String?) {
        print(#function, title, memo)
        coreDataService.addItem(type: TodoEntity.self,
                                params: [
                                    "title" : title,
                                    "memo" : memo ?? ""
                                ])
    }
}

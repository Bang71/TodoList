//
//  ListViewModel.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    @Published var items = [TodoItem]()
    
    init(context: NSManagedObjectContext) {
        let fetchRequest = NSFetchRequest<TodoItem>(entityName: "TodoItem")
        do {
            items = try context.fetch(fetchRequest)
        } catch {
            print("Fetch failed")
        }
    }
}

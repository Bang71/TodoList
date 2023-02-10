//
//  CoreDataStack.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/07.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }

    func fetchItems<T: NSFetchRequestResult>(type: T.Type) -> [T]? {
        let request = NSFetchRequest<T>(entityName: String(describing: T.self))
        
        do {
            return try container.viewContext.fetch(request)
        } catch {
            print("Fetch failed.")
            return nil
        }
    }
    
    func addItem<T: NSManagedObject>(type: T.Type, params: [String: Any]) {
        guard let newItem = T(context: container.viewContext) as? TodoEntity else {
            print("Entity access failed.")
            return
        }
        
        newItem.id = UUID().uuidString
        
        params.forEach {
            switch $0.key {
            case "title": newItem.title = $0.value as? String
            case "memo": newItem.memo = $0.value as? String
            default: return
            }
        }
        
        saveData()
    }
    
    func deleteItem(item: NSManagedObject) {
        container.viewContext.delete(item)
        saveData()
    }
    
    func updateItem(item: TodoEntity, params: [String: Any]) {
        params.forEach {
            switch $0.key {
            case "title": item.title = $0.value as? String
            case "memo": item.memo = $0.value as? String
            case "isCompleted": item.isCompleted = $0.value as? Bool ?? false
            default: return
            }
        }
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            print("Save failed.")
        }
    }
}

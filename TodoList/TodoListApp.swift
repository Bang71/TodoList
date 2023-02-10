//
//  TodoListApp.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI

@main
struct TodoListApp: App {
    let coreDataStack = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            ListView(coreDataStack: coreDataStack)
        }
    }
}

//
//  ListView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI
import CoreData

struct ListView: View {
//    @Environment(\.managedObjectContext) private var context
    
    @ObservedObject private var viewModel: ListViewModel
    
    init(context: NSManagedObjectContext) {
        self.viewModel = ListViewModel(context: context)
            
    }
    
    var body: some View {
        NavigationStack {
//            List($viewModel.todos, editActions: [.delete, .move]) { $todo in
//                NavigationLink(todo.title) {
//                    DetailView(todo: todo)
//                }
//                .foregroundColor(todo.isComplete ? .gray : .black)
//                .strikethrough(todo.isComplete, color: .gray)
//            }
//            .navigationTitle("TodoList")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(context: CoreDataStack.shared.persistentContainer.viewContext)
    }
}

//
//  ListView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI
import CoreData

struct ListView: View {
    @ObservedObject private var viewModel: ListViewModel
    
    init(coreDataStack: CoreDataStack) {
        self.viewModel = ListViewModel(coreDataStack: coreDataStack)
//        viewModel.previews()
    }
    
    var body: some View {
        NavigationStack {
//            List($viewModel.items, editActions: [.delete, .move]) { $item in
//                NavigationLink(item.title ?? "") {
//                    DetailView(item: item)
//                }
//                .foregroundColor(item.isCompleted ? .gray : .black)
//                .strikethrough(item.isCompleted, color: .gray)
//            }
//            .navigationTitle("TodoList")
        }
    }
    
    func delete(at offsets: IndexSet) {
            
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(context: CoreDataStack.shared.persistentContainer.viewContext)
//    }
//}

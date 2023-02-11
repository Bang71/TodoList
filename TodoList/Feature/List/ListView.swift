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
    @State private var showAddModal = false
    @State private var showDetailEntity: TodoEntity?
    
    init() {
        self.viewModel = ListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.items) { $item in
                    Button {
                        self.showDetailEntity = item
                    } label: {
                        Text(item.title ?? "NONAME")
                            .foregroundColor(item.isCompleted ? .gray : .black)
                            .strikethrough(item.isCompleted, color: .gray)
                    }
                    .sheet(item: $showDetailEntity) {
                        viewModel.fetchTodos()
                    } content: { detail in
                        DetailView(showModal: self.$showDetailEntity, item: detail)
                    }
                }
                .onDelete(perform: viewModel.deleteTodo)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        self.showAddModal.toggle()
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                    .sheet(isPresented: $showAddModal, onDismiss: {
                        viewModel.fetchTodos()
                    }) {
                        AddView(showModal: self.$showAddModal)
                    }
                }
            }
            .navigationTitle("Todo List")
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(context: CoreDataStack.shared.persistentContainer.viewContext)
//    }
//}

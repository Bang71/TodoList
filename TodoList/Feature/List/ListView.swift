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
    @State private var showUpdateModal = false
    
    init() {
        self.viewModel = ListViewModel()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach($viewModel.items) { $item in
                    Button {
                        self.showUpdateModal.toggle()
                    } label: {
                        Text(item.title ?? "NONAME")
                            .foregroundColor(item.isCompleted ? .gray : .black)
                            .strikethrough(item.isCompleted, color: .gray)
                    }
                    .sheet(isPresented: $showUpdateModal, onDismiss: {
                        viewModel.fetchTodos()
                    }) {
                        DetailView(showModal: self.$showUpdateModal, item: item)
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

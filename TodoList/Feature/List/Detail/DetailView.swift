//
//  DetailView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = DetailViewModel()
    @Binding var showModal: TodoEntity?
    
    var item: TodoEntity
    @State var title: String
    @State var memo: String
    @State var isCompleted: Bool
    
    init(viewModel: DetailViewModel = DetailViewModel(), showModal: Binding<TodoEntity?>, item: TodoEntity) {
        self.viewModel = viewModel
        self._showModal = showModal
        
        self.item = item
        self.title = item.value(forKey: "title") as? String ?? ""
        self.memo = item.value(forKey: "memo") as? String ?? ""
        self.isCompleted = item.value(forKey: "isCompleted") as? Bool ?? false
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
                Section {
                    TextField("Description", text: $memo)
                }
                Section {
                    HStack {
                        Text("Completed")
                        Toggle(isOn: $isCompleted) {
                            
                        }
                    }
                }
                Section {
                    Button {
                        viewModel.updateTodo(item: item, title: title, memo: memo, isCompleted: isCompleted)
                        self.showModal = nil
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationBarTitle(Text("Update Todo"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showModal = nil
            }) {
                Text("Cancel").bold()
            })
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
////        DetailView(todo: Todo(title: "temp", description: "", isComplete: false))
////        DetailView(item: TodoItem())
//    }
//}

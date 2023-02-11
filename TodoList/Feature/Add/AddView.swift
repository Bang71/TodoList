//
//  AddView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/11.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var viewModel = AddViewModel()
    @Binding var showModal: Bool
    
    @State var title: String = ""
    @State var memo: String = ""
    
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
                    Button {
                        viewModel.addTodo(title: title, memo: memo)
                        self.showModal.toggle()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .navigationBarTitle(Text("Add Todo"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showModal.toggle()
            }) {
                Text("Cancel").bold()
            })
        }
    }
}

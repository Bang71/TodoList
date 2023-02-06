//
//  DetailView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = DetailViewModel()
    @State var todo: Todo
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $todo.title) {
                    
                }
            }
            Section {
                TextField("Description", text: $todo.description) {
                    
                }
            }
            Section() {
                HStack {
                    Text("Complete")
                    Toggle(isOn: $todo.isComplete) {
                        
                    }
                }
            }
        }
        .navigationTitle("Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(todo: Todo(title: "temp", description: "", isComplete: false))
    }
}

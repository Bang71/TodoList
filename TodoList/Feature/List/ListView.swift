//
//  ListView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel = ListViewModel()
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationStack {
            List($viewModel.todos, editActions: [.delete, .move]) { $todo in
                NavigationLink(todo.title) {
                    DetailView(todo: todo)
                }
                .foregroundColor(todo.isComplete ? .gray : .black)
                .strikethrough(todo.isComplete, color: .gray)
            }
            .navigationTitle("TodoList")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

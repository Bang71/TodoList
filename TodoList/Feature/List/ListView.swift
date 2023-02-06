//
//  ListView.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import SwiftUI

struct ListView: View {
    @ObservedObject private var viewModel = ListViewModel()
    
    var body: some View {
        List($viewModel.todos, editActions: [.delete, .move]) { $todo in
            Text(todo.title)
                .foregroundColor(todo.isComplete ? .gray : .black)
                .strikethrough(todo.isComplete, color: .gray)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

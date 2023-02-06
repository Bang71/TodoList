//
//  Todo.swift
//  TodoList
//
//  Created by 신병기 on 2023/02/06.
//

import Foundation

struct Todo: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var description: String
    var isComplete: Bool
}

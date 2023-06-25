//
//  TodoListItem.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import Foundation

struct TodoListItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdTime: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
}

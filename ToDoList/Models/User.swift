//
//  User.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import Foundation

struct User: Codable{
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval
}

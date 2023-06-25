//
//  TodoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class TodoListItemViewViewModel: ObservableObject{
    
    init(){}
    
    func toggleIsDone(item: TodoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone) //set to the opposite of the current value
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}

 //
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register(){
        errorMessage = ""
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self]result, error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
            
        }
        
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, username: userName, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        
        guard email.contains("@") && email.contains("@") else{
            errorMessage = "Please enter valid email."
            return false
        }
        
        guard !userName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill out all fields."
            return false
        }
        
        guard password.count >= 6 else{
            return false
        }
        
        return true
    }
    
}

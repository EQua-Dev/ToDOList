//
//  RegisterView.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subTitle: "Start Organizing Your Todos", angle: -15, background: .orange)
        
            Form{
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                TextField("Your Name", text: $viewModel.userName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Your Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Create Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                TLButton(btnText: "Create Account", backgoundColor: .green)
                         {
                             viewModel.register()
                         }
                         .padding()
            }
        .offset(y: -50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}





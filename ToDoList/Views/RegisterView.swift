//
//  RegisterView.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack{
            HeaderView(title: "Register", subTitle: "Start Organizing Your Todos", angle: -15, background: .orange)
            
            Form{
                TextField("Your Name", text: $username).textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Your Email", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Create Password", text: $password)
                
                Button{
                    
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green)
                        Text("Create Account").bold()
                            .foregroundColor(Color.white)
                    }
                }
                
            }.offset(y: -50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

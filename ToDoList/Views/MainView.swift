//
//  ContentView.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //if user is signed in, show todo screen
           accountView
        } else{
            //show login screen
            LoginView()
        }
    
        
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            TodoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

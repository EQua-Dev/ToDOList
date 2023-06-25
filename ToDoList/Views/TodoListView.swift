//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel = TodoListViewViewModel()
    
    private let userId: String
    
    init( userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }.sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            
        }
    }
}

struct TodoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(userId: "")
    }
}

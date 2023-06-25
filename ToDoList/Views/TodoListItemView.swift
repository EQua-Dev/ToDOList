//
//  TodoListItemView.swift
//  ToDoList
//
//  Created by Richard Uzor on 23/06/2023.
//

import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: TodoListItem
    var body: some View {
        
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.green)
            }.padding()
        }
        
    }
}

struct TodoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListItemView(item: .init(id: "123", title: "Dummy title", dueDate: Date().timeIntervalSince1970, createdTime: Date().timeIntervalSince1970, isDone: true))
    }
}

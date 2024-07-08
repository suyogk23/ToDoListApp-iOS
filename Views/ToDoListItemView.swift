//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    
    let item: ToDOListItem
    var body: some View {
        HStack(){
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title3)
                    .bold()
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            }
            label:{
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
                    .foregroundColor(.orange)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(id:"123",
                                 title: "Get Stuff",
                                 dueDate: Date().timeIntervalSince1970,
                                 createDate: Date().timeIntervalSince1970,
                                 isDone: false
                                ))
}

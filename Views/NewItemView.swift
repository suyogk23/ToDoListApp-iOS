//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,50)
            Form{
                //title
                TextField("Title", text:$viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                //button
                TLButton(title: "Save", color: .orange){
                    if(viewModel.canSave){
                        viewModel.save()
                        newItemPresented=false
                    }
                    else{
                        viewModel.showAlert=true
                    }
                }
            }.alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message:Text("Please fill in valid title and due date. Due date must me today or a later date."))
            })
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in}))
}

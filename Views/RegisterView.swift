//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //header
            HeaderView(title:"Register", subtitle:"Remeber. Organise.", angle:40, background:.orange)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                //button
                TLButton(title: "Create Account", color: .green){
                    //register attempt
                    viewModel.register()
                }
            }
            .offset(y:-50)
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}

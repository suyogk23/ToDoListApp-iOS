//
//  LogInView.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title:"To Do List", subtitle:"Never Forget.", angle: -40, background:.orange)
                
                //login form
                Form{
                    //error handling
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $viewModel.password)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    //Button
                    TLButton(title:"Log In",color: .blue){
                        //log in attempt
                        viewModel.login()
                    }
                    
                }
                
                //create account
                VStack{
                    Text("New User?")
                    NavigationLink("Sign Me Up", destination: RegisterView())
                }
                .padding(.bottom,20)
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

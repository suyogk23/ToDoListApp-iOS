//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject{
    @Published var email=""
    @Published var password=""
    @Published var errorMessage=""
    
    init(){} 
    func login(){
        guard validate() else{
            return
        }
        
        //attempt login
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate()->Bool{
        //! emptyfield
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage="Please fill in all the required fields!"
            return false
        }
        // validate email
        guard email.contains("@") && email.contains(".")else{
            errorMessage="Please enter valid email!"
            return false
        }
        return true
        //print("called")
    }
    
}

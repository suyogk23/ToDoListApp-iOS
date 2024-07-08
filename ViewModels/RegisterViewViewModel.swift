//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var email=""
    @Published var password=""
    @Published var name=""
    
    init(){}
    
    func register(){
        guard validate()
        else{
            return
        }
        //register new user
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in guard let userId = result?.user.uid
            else{
                return
            }
            self?.inserUserRecord(id: userId)
        }
    }
    
    private func inserUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate()->Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else{
            return false
        }
        
        guard password.count>=6
        else{
            return false
        }
        
        return true
    }
}

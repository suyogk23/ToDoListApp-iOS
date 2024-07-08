//
//  NewItemViewModel.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init(){
        
    }
    
    func save(){
        guard(canSave)
        else{
            return
        }
        
        //get current user if
        guard let UID = Auth.auth().currentUser?.uid else{
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newItem = ToDOListItem(id: newId,
                                   title: title,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createDate: Date().timeIntervalSince1970,
                                   isDone: false
                                    )
        
        //save to DB as a subcollection of current user
        let db = Firestore.firestore()
        db.collection("users")
            .document(UID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-24*60*60)
        else{
            return false
        }
        return true
    }
}

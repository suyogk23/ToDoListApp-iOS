//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//for each single to do list entity
class ToDoListItemViewViewModel: ObservableObject{

    init(){
        
    }
    func toggleIsDone(item: ToDOListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid=Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary()
            )
    }
}

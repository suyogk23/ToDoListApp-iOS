//
//  ToDoListViewModel.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import Foundation
import FirebaseFirestore
 
//primary tab
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    //delete to do list item
    //param = item_id to delete
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}

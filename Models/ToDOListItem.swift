//
//  ToDOListItem.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import Foundation


struct ToDOListItem: Codable, Identifiable{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}

//
//  Extensions.swift
//  ToDoListApp
//
//  Created by Suyog K on 02/07/24.
//

import Foundation

extension Encodable{
    func asDictionary()->[String: Any]{
        guard let data = try? JSONEncoder().encode(self)
        else{
            return [:]   //empty dict
        }
        
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }
        catch{
            return [:]
        }
    }
}

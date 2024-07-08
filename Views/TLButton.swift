//
//  TLButton.swift
//  ToDoListApp
//
//  Created by Suyog K on 25/06/24.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let color:Color
    let action: () -> Void
        
    var body: some View {
        Button{
            action()
        }label: {
           Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                    //.padding(_:5) //padding for all edges
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
            Spacer()
        }
    }
}

#Preview {
    TLButton(title:"Demo", color:.pink){
        //action
    }
}

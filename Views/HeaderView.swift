//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle:String
    let angle:Double
    let background:Color
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .offset(y:-60)
            
            VStack{
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(Color.black)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size:20))
                    .foregroundColor(Color.white)
            }
            .padding(.bottom,50)
        }
        .frame(width: UIScreen.main.bounds.width*3,    //3*the bounds of screen in x axis
               height:300)
        //.offset(y:-1)
    }
}

#Preview {
    HeaderView(title:"Title", subtitle:"Subtitle",angle:-40,background:.blue)
}

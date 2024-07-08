//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Suyog K on 24/06/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel=ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    profile(user: user)
                }
                else{
                    Text("Loading Profile....")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        //avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.orange)
            .frame(width: 125, height: 125)
            .padding(20)
        
        //user info : name, email, member since, sign out
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Spacer()
                Text(user.name)
            }
            .padding(5)
            HStack{
                Text("Email: ")
                    .bold()
                Spacer()
                Text(user.email)
            }
            .padding(5)
            HStack{
                Text("Member since: ")
                    .bold()
                Spacer()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(5)
        }
        .padding()
        //log out
        Button("Log Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}

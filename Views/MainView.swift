//
//  ContentView.swift
//  ToDoListApp
//
//  Created by Suyog K on 18/06/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        }
        else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
            }
        }
        .accentColor(.orange)
    }
}
 
struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        MainView()
    }
}

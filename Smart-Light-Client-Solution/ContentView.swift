//
//  ContentView.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            
            HomeView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            
            DiscoverView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "location.circle")
                    Text("Discover")
                }
                .tag(2)
            
            FAQView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(3)
            
            ProfileView(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Me")
                }
                .tag(4)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

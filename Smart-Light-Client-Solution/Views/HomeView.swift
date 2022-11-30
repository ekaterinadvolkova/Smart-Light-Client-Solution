//
//  HomeView.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import SwiftUI
import UIKit

struct HomeView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("Welcome to Smart Light ")
                    .font(.title3)
                
                //add buttons
                
                Button("On") {
                    print("Light on!")
                    if let url = URL(string: (backendURL + on)) {
                        let urlSession = URLSession(configuration: .default).dataTask(with: url)
                        urlSession.resume()
                    }
                    
                    
                }
                
                Button("Off") {
                    print("Light off!")
                    if let url = URL(string: (backendURL + off)) {
                        let urlSession = URLSession(configuration: .default).dataTask(with: url)
                        urlSession.resume()
                    }
                }
            }
        }
    }
}

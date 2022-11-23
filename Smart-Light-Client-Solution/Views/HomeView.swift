//
//  HomeView.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import SwiftUI

struct HomeView: View {
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("Welcome to Smart Light ")
                    .font(.title3)
            }
        }
    }
}

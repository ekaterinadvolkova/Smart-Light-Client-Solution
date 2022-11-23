//
//  DiscoverView.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import SwiftUI

struct DiscoverView: View {
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("Discover")
                    .font(.title3)
            }
        }
    }
}

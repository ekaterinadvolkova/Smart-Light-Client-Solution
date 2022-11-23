//
//  FAQView.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import SwiftUI

struct FAQView: View {
    @Binding var tabSelection: Int

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                Text("Documentation")
                    .font(.title3)
            }
        }
    }
}

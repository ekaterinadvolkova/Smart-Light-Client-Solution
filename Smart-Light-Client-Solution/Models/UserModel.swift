//
//  UserModel.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import Foundation

@MainActor
class UserModel: ObservableObject {
    @Published var users: [User] = []
    
}

struct User: Codable, Identifiable {
    var id: String
    var email: String
    var password: String
    var devices: [Device]
}


//
//  DeviceModel.swift
//  Smart-Light-Client-Solution
//
//  Created by Ekaterina Volkova on 23.11.2022.
//

import Foundation

@MainActor
class DeviceModel: ObservableObject {
    @Published var devices: [Device] = []
    
}

struct Device: Codable, Identifiable {
    var id: String
    var state: Bool
}

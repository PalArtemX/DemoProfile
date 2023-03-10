//
//  Latest.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import Foundation

struct Latest: Codable, Identifiable {
    let id = UUID()
    
    let category: String
    let name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}

//
//  Latest.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import Foundation

// MARK: - Latest
struct Latest: Codable {
    let latests: [LatestElement]
    
    enum CodingKeys: String, CodingKey {
        case latests = "latest"
    }
}

// MARK: - LatestElement
struct LatestElement: Codable, Identifiable {
    let id = UUID()
    let category, name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}

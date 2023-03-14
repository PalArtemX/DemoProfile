//
//  FlashSale.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import Foundation

// MARK: - FlashSale
struct FlashSale: Codable {
    let flashSales: [FlashSaleElement]

    enum CodingKeys: String, CodingKey {
        case flashSales = "flash_sale"
    }
}

// MARK: - FlashSaleElement
struct FlashSaleElement: Codable, Identifiable {
    let id = UUID()
    let category, name: String
    let price: Double
    let discount: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price, discount
        case imageURL = "image_url"
    }
}

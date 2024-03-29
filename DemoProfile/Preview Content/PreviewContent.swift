//
//  PreviewContent.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import Foundation


struct PreviewContent {
    
    static let flashSale = FlashSale.Element(
        category: "Phone",
        name: "Samsung Plus",
        price: 46, discount: 30,
        imageURL: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg"
    )
    
    static let latest = Latest.Element(
        category: "phone",
        name: "Samsung",
        price: 145,
        imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"
    )
    
    static let latests = [
        Latest.Element(category: "photo", name: "Samsung", price: 4234, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"),
        Latest.Element(category: "Games", name: "Apple", price: 4234, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"),
        Latest.Element(category: "photo", name: "Samsung", price: 4234, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"),
        Latest.Element(category: "Photo", name: "Samsung", price: 4234, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"),
        Latest.Element(category: "photo", name: "Play Station", price: 4234, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"),
        Latest.Element(category: "headphone", name: "Samsung", price: 4234, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"),
        Latest.Element(category: "kids", name: "Samsung", price: 4234, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"),
    ]
    
    static let flashSales = [
        FlashSale.Element(category: "Games", name: "Apple Watch", price: 12.2, discount: 30, imageURL: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg"),
        FlashSale.Element(category: "Kids", name: "Samsung A10", price: 12.34, discount: 25, imageURL: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg")
    ]
    
    static let brands = ["Apple", "Samsung", "Nike", "New Balance", "Sony"]
    
    static let networkService = NetworkManager()
    
    static let detail = Detail(name: "Test Name Product", description: "Shoes inspired by 80s running shoes are still relevant today", rating: 4.3, numberOfReviews: 1000, price: 10, colors: ["#645fff", "#b590b5", "#054300"], imageUrls: ["https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg", "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/a94fbe7d8dfb4d3bbaf9ac63000135ed_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg", "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"])
    
    static let imageURLs = [ "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg", "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_03_standard.jpg", "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1fd1b80693d34f2584b0ac6300034598_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_05_standard.jpg"]
}

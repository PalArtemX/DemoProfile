//
//  PreviewContent.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import Foundation


struct PreviewContent {
    
    static let flashSale = FlashSale(
        category: "Phone",
        name: "Samsung Plus",
        price: 46, discount: 30,
        imageURL: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg"
    )
    
    static let latest = Latest(
        category: "phone",
        name: "Samsung",
        price: 145,
        imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"
    )
    
    static let latests = [
        Latest(category: "photo", name: "Samsung", price: 4234, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"),
        Latest(category: "Games", name: "Apple", price: 4234, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"),
        Latest(category: "photo", name: "Samsung", price: 4234, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"),
        Latest(category: "Photo", name: "Samsung", price: 4234, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"),
        Latest(category: "photo", name: "Play Station", price: 4234, imageURL: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig"),
        Latest(category: "headphone", name: "Samsung", price: 4234, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"),
        Latest(category: "kids", name: "Samsung", price: 4234, imageURL: "https://www.tradeinn.com/f/13754/137546834/microsoft-xbox-xbox-one-s-1tb-console-additional-controller.jpg"),
        
    ]
    
    static let flashSales = [
        FlashSale(category: "Games", name: "Apple Watch", price: 12.2, discount: 30, imageURL: "https://assets.reebok.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/3613ebaf6ed24a609818ac63000250a3_9366/Classic_Leather_Shoes_-_Toddler_White_FZ2093_01_standard.jpg"),
        FlashSale(category: "Kids", name: "Samsung A10", price: 12.34, discount: 25, imageURL: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg")
    ]
    
    static let brands = ["Apple", "Samsung", "Nike", "New Balance", "Sony"]
    
    static let iconsHomeView: [Resources.HomeIcon] = [.phones, .headPhones, .games, .cars, .furniture, .kids]
}

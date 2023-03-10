//
//  Image + ext.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

// MARK: - Icon TabBar
struct IconTabBar {
    
    let account = Image("account")
    let basket = Image("basket")
    let house = Image("house")
    let like = Image("like")
    let message = Image("message")
    
}

extension Image {
    static let iconTabBar = IconTabBar()
}

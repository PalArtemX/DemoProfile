//
//  Color + ext.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct ColorTheme {
    
    let background = Color("background")
    let backgroundIconTabBar = Color("backgroundIconTabBar")
    let backgroundLoginTextField = Color("backgroundLoginTextField")
    let backgroundSearch = Color("backgroundSearch")
    let blue = Color("blue")
    let iconLike = Color("iconLike")
    let iconTabBarActive = Color("iconTabBarActive")
    let iconTabBarInactive = Color("iconTabBarInactive")
    let text = Color("text")
    let textSecondary = Color("textSecondary")
}


extension Color {

    static let colorTheme = ColorTheme()
    
}

//
//  Color + ext.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct ColorTheme {
    
    let background = Color("background")
    let backgroundIcon = Color("backgroundIcon")
    let backgroundLoginTextField = Color("backgroundLoginTextField")
    let backgroundSearch = Color("backgroundSearch")
    let blue = Color("blue")
    let iconLike = Color("iconLike")
    let iconTabBarActive = Color("iconTabBarActive")
    let iconTabBarInactive = Color("iconTabBarInactive")
    let text = Color("text")
    let textSecondary = Color("textSecondary")
    let foregroundColorButton = Color("foregroundColorButton")
    let profileSecondary = Color("profileSecondary")
    let profileUserName = Color("profileUserName")
    let homeSecondaryIcon = Color("homeSecondaryIcon")
}


extension Color {

    static let colorTheme = ColorTheme()
    
}

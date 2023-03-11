//
//  TabBarItem.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

enum TabBarItem: Hashable {
    
    case house
    case like
    case basket
    case message
    case account
    
    var iconName: String {
        switch self {
        case .house:
            return "house"
        case .like:
            return "like"
        case .basket:
            return "basket"
        case .message:
            return "message"
        case .account:
            return "account"
        }
    }
}



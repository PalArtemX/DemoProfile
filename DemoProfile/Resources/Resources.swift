//
//  Resources.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import Foundation


enum Resources {
    
    enum SignInWith {
        case apple, google
        
        var icon: String {
            switch self {
            case .apple:
                return "Apple"
            case .google:
                return "Google"
            }
        }
        
        var name: String {
            switch self {
            case .apple:
                return "Apple"
            case .google:
                return "Google"
            }
        }
    }
    
    enum Profile {
        case card, help, logOut, restore
        
        var name: String {
            switch self {
            case .card:
                return "card"
            case .help:
                return "help"
            case .logOut:
                return "logOut"
            case .restore:
                return "restore"
            }
        }
    }
    
}

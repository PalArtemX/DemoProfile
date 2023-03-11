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
    
}

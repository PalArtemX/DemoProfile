//
//  User.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import Foundation

struct User: Codable, Hashable {
    
    let firstName: String
    let lastName: String
    let email: String
    let password: String
    
}

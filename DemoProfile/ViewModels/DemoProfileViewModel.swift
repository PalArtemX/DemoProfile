//
//  DemoProfileViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI


final class DemoProfileViewModel: ObservableObject {
    
    @Published private(set) var userLoggedIn = false
    @Published private(set) var messageAlert = ""
    @Published private(set) var titleAlert = ""
    @Published var nicknameUnique = false
    @Published var showAlert = false
    
    private(set) var users: [User] = [] {
        didSet {
            putUsers()
        }
    }
    
    private let userKey = "userKey"
    
    init() {
        getUsers()
    }
    
}


// MARK: - user registration
extension DemoProfileViewModel {
    
    private func putUsers() {
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: userKey)
        }
    }
    
    private func getUsers() {
        if let data = UserDefaults.standard.data(forKey: userKey) {
            if let users = try? JSONDecoder().decode([User].self, from: data) {
                self.users = users
            }
        }
    }
    
    private func signIn() {
        userLoggedIn = true
    }
    
    private func userNameValidSignIn(name: User) -> Bool {
        if name.firstName.isEmpty {
            messageAlert = "Fields should not be empty"
            titleAlert = "Write your first name"
            showAlert = true
            return false
        } else if name.lastName.isEmpty {
            messageAlert = "Fields should not be empty"
            titleAlert = "Write your last name"
            showAlert = true
            return false
        } else if name.email.isEmpty {
            messageAlert = "Fields should not be empty"
            titleAlert = "Write your email"
            showAlert = true
            return false
        } else {
            return true
        }
        
    }
    
    func registrationUser(firstName: String, lastName: String, email: String) -> Bool {
        let user = User(firstName: firstName, lastName: lastName, email: email, password: "")
        
        guard userNameValidSignIn(name: user) else { return false }
        
        if users.contains(user) {
            messageAlert = "The user is already registered"
            print("+++++++")
            return false
        } else {
            print("-------")
            users.append(user)
            signIn()
            return true
        }
    }
    
}

//
//  SignInViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI


final class SignInViewModel: ObservableObject {
    
    @Published private(set) var userLoggedIn = false
    @Published private(set) var messageAlert = ""
    @Published private(set) var titleAlert = ""
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


extension SignInViewModel {
    // Since there is no password input in the user interface during registration, registration and user login are implemented with stubs
    
    func loginUser(firstName: String, password: String) -> Bool {
        let user = User(firstName: firstName, lastName: "Name", email: "email@email.com", password: "pass")
        print(">>>>>>> \(user)")
        
        if users.contains(user) {
            print("contains >> \(users)")
            signIn()
            return true
        } else {
            titleAlert = "Such a user is not registered"
            messageAlert = "Such a user is not registered, check the correctness of the login and password"
            showAlert = true
            return false
        }
    }
    
    func registrationUser(firstName: String, lastName: String, email: String) -> Bool {
        let user = User(firstName: firstName, lastName: lastName, email: email, password: "pass")
        
        guard userNameValidSignIn(name: user) else { return false }
        
        if users.contains(user) {
            titleAlert = "The user is already registered"
            messageAlert = "The user is already registered, log in with your username"
            showAlert = true
            return false
        } else {
            users.append(user)
            signIn()
            return true
        }
    }
    
    private func signIn() {
        userLoggedIn = true
    }
    
    private func signOut() {
        userLoggedIn = false
    }
    
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
        } else if !name.email.isValidEmail() {
            messageAlert = "Email is incorrect, enter the correct email!"
            titleAlert = "Write your email"
            showAlert = true
            return false
        } else {
            return true
        }
    }
    
}

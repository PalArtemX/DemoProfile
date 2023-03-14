//
//  DemoProfileApp.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

@main
struct DemoProfileApp: App {
    
    @StateObject var signInViewModel = SignInViewModel()
    @StateObject var profileViewModel = ProfileViewModel()
    @StateObject var homeViewModel = HomeViewModel(dataServices: NetworkManager())
    
    var body: some Scene {
        WindowGroup {
            if signInViewModel.userLoggedIn {
                MainTabBarView()
                    .environmentObject(signInViewModel)
                    .environmentObject(profileViewModel)
                    .environmentObject(homeViewModel)
            } else {
                SignInPageView()
                    .environmentObject(signInViewModel)
            }
        }
    }
}

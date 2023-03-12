//
//  DemoProfileApp.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

@main
struct DemoProfileApp: App {
    
    @StateObject var demoProfileViewModel = SignInViewModel()
    
    var body: some Scene {
        WindowGroup {
            if demoProfileViewModel.userLoggedIn {
                MainTabBarView()
                    .environmentObject(demoProfileViewModel)
            } else {
                SignInPageView()
                    .environmentObject(demoProfileViewModel)
            }
        }
    }
}

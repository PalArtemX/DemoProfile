//
//  MainTabBarView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct MainTabBarView: View {
    
    @State private var selector = TabBarItem.house
    
    var body: some View {
        TabBarView(selection: $selector) {
            HomeView()
                .tabBarItem(tab: .house, selection: $selector)
            
            LikeView()
                .tabBarItem(tab: .like, selection: $selector)
            
            BasketView()
                .tabBarItem(tab: .basket, selection: $selector)
            
            MessageView()
                .tabBarItem(tab: .message, selection: $selector)
            
            ProfileView()
                .tabBarItem(tab: .account, selection: $selector)
        }
        .ignoresSafeArea()
    }
}




struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
            .environmentObject(SignInViewModel())
            .environmentObject(ProfileViewModel())
    }
}

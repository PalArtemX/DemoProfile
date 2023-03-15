//
//  MainTabBarView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct MainTabBarView: View {
    
    @EnvironmentObject var signInViewModel: SignInViewModel
    
    var body: some View {
        TabBarView(selection: $signInViewModel.tabBarTag) {
            HomeView()
                .tabBarItem(tab: .house, selection: $signInViewModel.tabBarTag)
            
            LikeView()
                .tabBarItem(tab: .like, selection: $signInViewModel.tabBarTag)
            
            BasketView()
                .tabBarItem(tab: .basket, selection: $signInViewModel.tabBarTag)
            
            MessageView()
                .tabBarItem(tab: .message, selection: $signInViewModel.tabBarTag)
            
            ProfileView()
                .tabBarItem(tab: .account, selection: $signInViewModel.tabBarTag)
        }
    }
}




struct MainTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBarView()
            .environmentObject(SignInViewModel())
            .environmentObject(ProfileViewModel())
            .environmentObject(HomeViewModel(dataServices: NetworkManager()))
    }
}

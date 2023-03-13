//
//  PhotoNavBarHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct PhotoNavBarHomeView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            if let image = profileViewModel.photoUser {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .frame(width: 32, height: 322)
                            .foregroundColor(.colorTheme.profileSecondary)
                    )
            } else {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.colorTheme.iconTabBarActive)
                    .padding()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .frame(width: 32, height: 32)
                            .foregroundColor(.colorTheme.profileSecondary)
                    )
    
            }
            
            Button {
                // action
            } label: {
                HStack {
                    Text("Location")
                        .foregroundColor(.colorTheme.homeSecondaryIcon)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.colorTheme.text)
                }
                .fontMontserrat(weight: .medium, size: 10)
            }
            

            
        }
        .offset(x: 0, y: 12)
        
    }
}




struct PhotoNavBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoNavBarHomeView()
            .environmentObject(ProfileViewModel())
    }
}

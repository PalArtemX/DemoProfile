//
//  PhotoUserView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 12/03/2023.
//

import SwiftUI

struct PhotoUserView: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        if let image = profileViewModel.photoUser {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .background(
                    Circle()
                        .frame(width: 62, height: 62)
                        .foregroundColor(.colorTheme.profileSecondary)
                )
        } else {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .foregroundColor(.colorTheme.iconTabBarActive)
                .padding()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .background(
                    Circle()
                        .frame(width: 62, height: 62)
                        .foregroundColor(.colorTheme.profileSecondary)
                )
        }
        
        
    }
}





struct PhotoUserView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoUserView()
            .environmentObject(ProfileViewModel())
    }
}

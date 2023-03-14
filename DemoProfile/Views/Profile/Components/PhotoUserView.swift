//
//  PhotoUserView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 12/03/2023.
//

import SwiftUI

struct PhotoUserView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    private let sizeImage: CGFloat = 61
    
    var body: some View {
        if let image = profileViewModel.photoUser {
            image
                .resizable()
                .scaledToFill()
                .frame(width: sizeImage, height: sizeImage)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1.5)
                        .foregroundColor(.colorTheme.profileSecondary)
                }
        } else {
            Image(systemName: "person")
                .resizable()
                .scaledToFit()
                .foregroundColor(.colorTheme.iconTabBarActive)
                .padding()
                .frame(width: sizeImage, height: sizeImage)
                .clipShape(Circle())
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1.5)
                        .foregroundColor(.colorTheme.profileSecondary)
                }
        }
    }
}





struct PhotoUserView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoUserView()
            .environmentObject(ProfileViewModel())
    }
}

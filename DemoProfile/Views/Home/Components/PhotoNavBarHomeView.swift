//
//  PhotoNavBarHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct PhotoNavBarHomeView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    private let sizeImage: CGFloat = 30
    
    var body: some View {
        VStack {
            if let image = profileViewModel.photoUser {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: sizeImage, height: sizeImage)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 1)
                            .foregroundColor(.colorTheme.homeSecondary)
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
                            .stroke(lineWidth: 1)
                            .foregroundColor(.colorTheme.homeSecondary)
                    }
            }
            
            Button {
                // action
            } label: {
                HStack {
                    Text("Location")
                        .foregroundColor(.colorTheme.homeSecondary)
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

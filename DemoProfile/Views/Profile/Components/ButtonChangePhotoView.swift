//
//  ButtonChangePhotoView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI
import PhotosUI

struct ButtonChangePhotoView: View {
    
    @EnvironmentObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        PhotosPicker(selection: $profileViewModel.selectedPhoto, matching: .images, photoLibrary: .shared()) {
            Text("Change photo")
                .fontMontserrat(weight: .medium, size: 10)
                .foregroundColor(.colorTheme.profileSecondary)
        }
    }
}




struct ButtonChangePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonChangePhotoView()
            .environmentObject(ProfileViewModel())
    }
}

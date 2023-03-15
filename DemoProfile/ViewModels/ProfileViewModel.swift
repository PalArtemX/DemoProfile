//
//  ProfileViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI
import PhotosUI

final class ProfileViewModel: ObservableObject {
    
    @Published private(set) var photoUser: Image?
    @Published var selectedPhoto: PhotosPickerItem? {
        didSet {
            selectPhoto(photo: selectedPhoto)
        }
    }
}



extension ProfileViewModel {
    
    func selectPhoto(photo: PhotosPickerItem?) {
        photo?.loadTransferable(type: Data.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let data, let image = UIImage(data: data) {
                        self.photoUser = Image(uiImage: image)
                    }
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        }
    }
}

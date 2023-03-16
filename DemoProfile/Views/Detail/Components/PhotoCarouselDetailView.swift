//
//  PhotoCarouselDetailView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI

struct PhotoCarouselDetailView: View {
    
    let imageURLs: [String]
    
    var body: some View {
        VStack {
            ZStack {
                // MARK: - Photo Carousel
                AsyncImage(url: URL(string: imageURLs.first ?? "")) { image in
                    ZStack {
                        HStack {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: UIScreen.main.bounds.width)
                                .frame(maxHeight: UIScreen.main.bounds.height / 4)
                                .clipped()
                                .cornerRadius(15, corners: [.topRight, .bottomRight])
                            
                            ButtonsLikeAndFavouritesView(actionLike: {}, actionFavorite: {})
                                .offset(x: -30, y: 30)
                            
                            Spacer()
                        }
                    }
                } placeholder: {
                    ZStack {
                        Rectangle()
                        ProgressView()
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .frame(maxHeight: UIScreen.main.bounds.height / 4)
                    .clipped()
                    .cornerRadius(15, corners: [.topRight, .bottomRight])
                    .padding(.trailing, 60)
                }
            }
            
            // MARK: - Photo Picker
            HStack {
                ForEach(imageURLs, id: \.self) { imageURL in
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 65)
                            .frame(height: 37)
                            .clipped()
                            .cornerRadius(5)
                    } placeholder: {
                        ZStack {
                            Rectangle()
                            ProgressView()
                        }
                        .foregroundColor(.white)
                        .frame(width: 65)
                        .frame(height: 37)
                        .clipped()
                        .cornerRadius(5)
                    }
                }
            }
            .padding(.vertical)
        }
    }
    
}





struct PhotoCarouselDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background
            PhotoCarouselDetailView(imageURLs: PreviewContent.imageURLs)
        }
    }
}

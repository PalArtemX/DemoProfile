//
//  PhotoCarouselDetailView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI

struct PhotoCarouselDetailView: View {
    
    let imageURLs: [String]
    @State private var selector = 0
    
    var body: some View {
        
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack {
                // MARK: - Photo Carousel
                TabView(selection: $selector) {
                        ForEach(0..<imageURLs.count, id: \.self) { index in
                            
                            VStack {
                                AsyncImage(url: URL(string: imageURLs[index])) { image in
                                    ZStack {
                                        HStack {
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(maxWidth: .infinity)
                                                .frame(maxHeight: UIScreen.main.bounds.height / 4)
                                                .clipped()
                                                .cornerRadius(15, corners: [.topRight, .bottomRight])
                                                .offset(x: 0, y: 75)
                                            
                                            ButtonsLikeAndFavouritesView(actionLike: {}, actionFavorite: {})
                                                .offset(x: -30, y: 30)
                                            
                                            Spacer()
                                        }
                                        .ignoresSafeArea()
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
                                
                                Spacer()
                            }
                            .tag(index)
                        }
                }
                .ignoresSafeArea()
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // MARK: - PhotoPicker
                HStack(spacing: 10.0) {
                    ForEach(0..<imageURLs.count, id: \.self) { index in
                        ButtonSelectImageView(select: index, imageURL: imageURLs[index]) {
                            withAnimation(.default) {
                                selector = index
                            }
                        }
                        .scaleEffect(selector == index ? 1.3 : 1)
                        .shadow(radius: selector == index ? 5 : 0)
                    }
                }
            }
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

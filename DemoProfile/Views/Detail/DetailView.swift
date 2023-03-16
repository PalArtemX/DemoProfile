//
//  DetailView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct DetailView: View {
    
    let detail: Detail
    @Environment(\.dismiss) var dismiss
    @State private var price = 10
    
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                
                // MARK: - Photo Carousel
                PhotoCarouselDetailView(imageURLs: detail.imageUrls)
                    .offset(x: 0, y: -75)
                
                // MARK: - Photo Piker
                
                
                VStack(alignment: .leading) {
                    // MARK: - Header and Price
                    HeaderAndPriceView(name: detail.name, price: detail.price)
                        .padding(.horizontal)
                    
                    // MARK: - Description
                    Text(detail.description)
                        .fontMontserrat(weight: .regular, size: 10)
                        .foregroundColor(.colorTheme.profileSecondary)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    // MARK: - Rating
                    RatingView(rating: detail.rating, numberOfReviews: detail.numberOfReviews)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    // MARK: - Color Picker
                    ColorPickerDetailView(hexColors: detail.colors)
                        .padding(.horizontal)
                    
                    Spacer()
                }
                
                Spacer()
                
                // MARK: - Add to card panel
                AddToCardPanelView(price: detail.price)
            }
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .fontMontserrat(weight: .bold, size: 18)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}




struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(detail: PreviewContent.detail)
        }
    }
}

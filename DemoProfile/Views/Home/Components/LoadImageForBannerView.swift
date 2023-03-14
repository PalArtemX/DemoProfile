//
//  LoadImageForBannerView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct LoadImageForBannerView: View {
    
    let imageURL: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height, alignment: .center)
                    .clipped()
                    .cornerRadius(10)
            } placeholder: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .scaledToFill()
                        .frame(width: width, height: height, alignment: .center)
                        .clipped()
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    ProgressView()
                }
            }
        }
        .frame(width: width, height: height, alignment: .center)
    }
}





struct LoadImageView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            LoadImageForBannerView(
                imageURL: "https://www.dhresource.com/0x0/f2/albu/g8/M01/9D/19/rBVaV1079WeAEW-AAARn9m_Dmh0487.jpg",
                width: 115,
                height: 150
            )
        }
    }
}

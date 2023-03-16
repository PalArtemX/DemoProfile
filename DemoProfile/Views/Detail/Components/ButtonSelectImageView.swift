//
//  ButtonSelectImageView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI

struct ButtonSelectImageView: View {
    
    let select: Int
    let imageURL: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 65, height: 37)
                    .cornerRadius(10)
                    .clipped()
            } placeholder: {
                ZStack {
                    Rectangle()
                    ProgressView()
                }
                .foregroundColor(.white)
                .frame(width: 65, height: 37)
                .clipped()
                .cornerRadius(10)

            }
        }
    }
}




struct ButtonSelectImageView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            ButtonSelectImageView(select: 1, imageURL: PreviewContent.imageURLs.first!, action: {})
        }
    }
}

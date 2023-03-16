//
//  ButtonsLikeAndFavouritesView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI

struct ButtonsLikeAndFavouritesView: View {
    
    let actionLike: () -> ()
    let actionFavorite: () -> ()
    
    var body: some View {
        VStack {
            Spacer()
            
            Button {
                actionLike()
            } label: {
                Image(systemName: "heart")
            }
            Spacer()
            
            Divider()
                .frame(width: 20)
            
            Spacer()
            
            Button {
                actionFavorite()
            } label: {
                Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
            }
            
            Spacer()
        }
        .fontMontserrat(weight: .bold, size: 14)
        .foregroundColor(.colorTheme.iconLike)
        .frame(width: 42, height: 95)
        .background(Color.colorTheme.foregroundColorButton.opacity(0.9))
        .cornerRadius(15)
    }
}




struct ButtonsLikeAndFavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsLikeAndFavouritesView(actionLike: {}, actionFavorite: {})
    }
}

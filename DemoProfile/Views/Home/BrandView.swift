//
//  BrandView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import SwiftUI

struct BrandView: View {
    
    let width: CGFloat = 170
    let height: CGFloat = 220
    let brand: String
    
    var body: some View {
        ZStack {
            Color.colorTheme.iconLike.opacity(0.5)
            
            Text(brand)
                .foregroundColor(.white)
                .fontMontserrat(weight: .bold, size: 18)
                .shadow(radius: 2)
        }
        .frame(width: width, height: height)
        .cornerRadius(15)
    }
}



struct BrandView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            BrandView(brand: "Nike")
        }
    }
}

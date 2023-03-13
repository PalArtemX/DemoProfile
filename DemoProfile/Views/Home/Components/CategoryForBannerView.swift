//
//  CategoryForBannerView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct CategoryForBannerView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.colorTheme.text)
            .fontMontserrat(weight: .semibold, size: 6)
            .padding(3)
            .padding(.horizontal, 5)
            .background(Color.white.opacity(0.5))
            .clipShape(Capsule())
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryForBannerView(title: "Kids")
    }
}

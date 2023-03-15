//
//  BrandCarouselHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import SwiftUI

struct BrandCarouselHomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                    ForEach(homeViewModel.brands, id: \.self) { brand in
                        BrandView(brand: brand)
                    }
            }
            .padding()
        }
    }
}




struct BrandCarouselHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background
            BrandCarouselHomeView()
                .environmentObject(HomeViewModel(dataServices: NetworkManager()))
        }
    }
}

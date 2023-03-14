//
//  FlashCarouselHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import SwiftUI

struct FlashCarouselHomeView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                if homeViewModel.allDataUploaded {
                    ForEach(homeViewModel.flashSale.flashSales) { flashSale in
                        FlashSaleView(flashSale: flashSale)
                    }
                }
            }
            .padding()
        }
    }
}




struct FlashCarouselHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FlashCarouselHomeView()
            .environmentObject(HomeViewModel())
    }
}

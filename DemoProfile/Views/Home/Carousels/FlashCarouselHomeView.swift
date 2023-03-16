//
//  FlashCarouselHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import SwiftUI

struct FlashCarouselHomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var detailViewModel: DetailViewModel
    @State private var isShowDetailView = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                    ForEach(homeViewModel.flashSale.elements) { flashSale in
                        NavigationLink {
                            DetailView(detail: detailViewModel.detail)
                        } label: {
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
            .environmentObject(HomeViewModel(dataServices: NetworkManager()))
            .environmentObject(DetailViewModel(dataServices: NetworkManager()))
    }
}

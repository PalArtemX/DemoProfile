//
//  LatestCarouselHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct LatestCarouselHomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 12) {
                    ForEach(homeViewModel.latest.elements) { latest in
                        LatestView(latest: latest)
                    }
            }
            .padding()
        }
    }
}




struct LatestCarouselHomeView_Previews: PreviewProvider {
    static var previews: some View {
        LatestCarouselHomeView()
            .environmentObject(HomeViewModel(dataServices: NetworkManager()))
    }
}

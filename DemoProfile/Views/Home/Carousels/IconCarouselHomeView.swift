//
//  IconCarouselHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct IconCarouselHomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20.0) {
                ForEach(homeViewModel.icons, id: \.self) { icon in
                    IconHomeView(item: icon)
                }
            }
            .padding()
        }
    }
}




struct IconCarouselHomeView_Previews: PreviewProvider {
    static var previews: some View {
        IconCarouselHomeView()
            .environmentObject(HomeViewModel(dataServices: NetworkManager()))
    }
}

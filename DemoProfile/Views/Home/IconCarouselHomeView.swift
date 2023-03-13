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
            HStack(spacing: 34.0) {
                ForEach(homeViewModel.icons, id: \.self) { item in
                    IconHomeView(item: item)
                    
                }
            }
            .padding()
        }
    }
}




struct IconCarouselHomeView_Previews: PreviewProvider {
    static var previews: some View {
        IconCarouselHomeView()
            .environmentObject(HomeViewModel())
    }
}

//
//  HomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.colorTheme.background.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0.0) {
                        // MARK: - Search
                        SearchView()
                            .padding(.horizontal, 50)
                        
                        // MARK: - Icon Carousel
                        IconCarouselHomeView()
                            .padding(.bottom)
                        
                        if homeViewModel.allDataUploaded {
                            VStack {
                                // MARK: - Latest Carousel
                                HeaderCarouselView(title: "Latest") {}
                                    .padding(.horizontal)
                                    .padding(.top)
                                LatestCarouselHomeView()
                                    .padding(.bottom)
                                
                                // MARK: - Flash Sale
                                HeaderCarouselView(title: "Flash Sale") {}
                                    .padding(.horizontal)
                                    .padding(.top)
                                
                                FlashCarouselHomeView()
                                    .padding(.bottom)
                                
                                // MARK: - Brands
                                HeaderCarouselView(title: "Brands") {}
                                    .padding(.horizontal)
                                    .padding(.top)
                                
                                BrandCarouselHomeView()
                                    .padding(.bottom)
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            TitleNavBarHomeView()
                        }
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                //
                            } label: {
                                Image("menuIconHome")
                                    .renderingMode(.template)
                                    .foregroundColor(.colorTheme.text)
                            }
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            PhotoNavBarHomeView()
                        }
                    }
                }
                .refreshable {
                    homeViewModel.loadingData()
                }
            }
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel(dataServices: NetworkManager()))
            .environmentObject(ProfileViewModel())
    }
}

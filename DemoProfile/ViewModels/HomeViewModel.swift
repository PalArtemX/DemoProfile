//
//  HomeViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var icons = PreviewContent.iconsHomeView
    @Published private(set) var brands = PreviewContent.brands
    
    @Published private(set) var latests: [Latest] = PreviewContent.latests
    @Published private(set) var flashSales: [FlashSale] = PreviewContent.flashSales
}

extension HomeViewModel {
    
    
    
}


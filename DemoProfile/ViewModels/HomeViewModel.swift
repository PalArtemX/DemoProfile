//
//  HomeViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var icons: [Resources.HomeIcon] = [.phones, .headPhones, .games, .cars, .furniture, .kids]
    
    
}

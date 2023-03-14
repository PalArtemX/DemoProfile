//
//  HomeViewModel.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    private let urlLatestAPI = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    private let urlFlashSaleAPI = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    
    @Published private(set) var icons: [Resources.HomeIcon] = [.phones, .headPhones, .games, .cars, .furniture, .kids]
    @Published private(set) var brands = PreviewContent.brands
    
    @Published private(set) var latest: Latest = Latest(latests: [])
    @Published private(set) var flashSale: FlashSale = FlashSale(flashSales: [])
    
    @Published private(set) var allDataUploaded = false
    
    var cancellable = Set<AnyCancellable>()
    
    init() {
        checkingLoadingAllData()
        getLatest()
        getFlashSale()
    }
}


extension HomeViewModel {
    
    private func checkingLoadingAllData() {
        $latest
            .combineLatest($flashSale)
            .map { (latest, flashSale) -> Bool in
                if !latest.latests.isEmpty && !flashSale.flashSales.isEmpty {
                    return true
                } else {
                    return false
                }
            }
            .eraseToAnyPublisher()
            .sink { [weak self] allDataUploaded in
                self?.allDataUploaded = allDataUploaded
            }
            .store(in: &cancellable)
    }
    
    private func getLatest() {
        guard let url = URL(string: urlLatestAPI) else { return } 
        
        NetworkManager.download(url: url)
            .decode(type: Latest.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedLatests in
                self?.latest = returnedLatests
            })
            .store(in: &cancellable)
    }
    
    private func getFlashSale() {
        guard let url = URL(string: urlFlashSaleAPI) else { return }
        
        NetworkManager.download(url: url)
            .decode(type: FlashSale.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedFlashSale in
                self?.flashSale = returnedFlashSale
            })
            .store(in: &cancellable)
    }

}




//
//  FlashSaleView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct FlashSaleView: View {
    let flashSale: FlashSaleElement
    let width: CGFloat = 170
    let height: CGFloat = 220
    
    var body: some View {
        ZStack {

            LoadImageForBannerView(imageURL: flashSale.imageURL, width: width, height: height)
            
            HStack {
                
                VStack(alignment: .leading) {
                    ImageForBannerView()
                    
                    Spacer()
                    
                    CategoryForBannerView(title: flashSale.category)
                    
                    Text(flashSale.name)
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 12)
                        .padding(.bottom)
                        .shadow(radius: 2)
                    
                    Text("$ \(flashSale.price)")
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 10)
                        .shadow(radius: 2)
                }
                .padding(6)
                Spacer()
                
                VStack {
                    SaleOffForBannerView(discount: flashSale.discount)
                        .padding(.top, 10)
        
                    Spacer()
                    
                    HStack(spacing: 18) {
                        ButtonForBannerView(systemName: "heart", size: 27, fontSize: 12, weightFont: .bold) {}
                        ButtonForBannerView(systemName: "plus", size: 34, fontSize: 22, weightFont: .semibold) {}
                    }
                    .padding(10)
                }
            }
        }
        .frame(width: width, height: height)
    }
}




struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.blue.ignoresSafeArea()
            
            FlashSaleView(flashSale: PreviewContent.flashSale)
        }
    }
}

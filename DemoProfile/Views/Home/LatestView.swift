//
//  LatestView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct LatestView: View {
    
    let latest: Latest
    let width: CGFloat = 115
    let height: CGFloat = 150
    
    var body: some View {
        ZStack {
            
            LoadImageForBannerView(imageURL: latest.imageURL, width: width, height: height)
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    CategoryForBannerView(title: latest.category)
                    
                    Text(latest.name)
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 9)
                        .padding(.bottom)
                        .shadow(radius: 2)
                    
                    Text("$ \(latest.price)")
                        .foregroundColor(.white)
                        .fontMontserrat(weight: .bold, size: 7)
                        .shadow(radius: 2)
                }
                .padding(6)
                Spacer()
                
                VStack {
                    Spacer()
                    ButtonForBannerView(systemName: "plus", size: 24, fontSize: 14, weightFont: .regular) {}
                        .padding(9)
                }
            }
            
            
        }
        .frame(width: width, height: height)
    }
}





struct LatestView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            LatestView(latest: Latest(category: "phone", name: "Samsung", price: 145, imageURL: "https://mirbmw.ru/wp-content/uploads/2022/01/manhart-mhx6-700-01.jpg"))
        }
    }
}

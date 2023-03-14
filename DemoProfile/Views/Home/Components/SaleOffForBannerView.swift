//
//  SaleOffForBannerView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import SwiftUI

struct SaleOffForBannerView: View {
    
    let discount: Int
    
    var body: some View {
        Text("\(discount)% off")
            .fontMontserrat(weight: .bold, size: 10)
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color.red)
            .clipShape(Capsule())
    }
}




struct SaleOffForBannerView_Previews: PreviewProvider {
    static var previews: some View {
        SaleOffForBannerView(discount: 30)
    }
}

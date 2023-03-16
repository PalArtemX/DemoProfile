//
//  HeaderAndPriceView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct HeaderAndPriceView: View {
    
    let name: String
    let price: Int
    
    var body: some View {
            HStack {
                // MARK: - Header
                Text(name)
                    .fontMontserrat(weight: .bold, size: 17)
                Spacer()
                // MARK: - Price
                Text("$ \(price)")
                    .fontMontserrat(weight: .bold, size: 14)
            }
            .foregroundColor(.colorTheme.text)
    }
}



struct HeaderAndPriceView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAndPriceView(name: "Reabok", price: 259)
    }
}

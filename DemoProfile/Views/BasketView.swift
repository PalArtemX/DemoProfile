//
//  BasketView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct BasketView: View {
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            Text("Basket View")
                .fontMontserrat(weight: .semibold, size: 30)
                .foregroundColor(.colorTheme.text)
        }
    }
}




struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}

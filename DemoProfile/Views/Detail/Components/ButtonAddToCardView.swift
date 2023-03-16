//
//  ButtonAddToCardView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct ButtonAddToCardView: View {
    
    let price: Int
    let productCount: Int
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text("$ \(price)")
                    .foregroundColor(.white.opacity(0.7))
                Spacer()
                Text("ADD TO CARD")
                    .foregroundColor(.white)
            }
            .fontMontserrat(weight: .bold, size: 8)
            .padding()
            .frame(width: 170, height: 40, alignment: .center)
            .background(Color.colorTheme.blue)
            .cornerRadius(17)
        }
    }
}





struct ButtonAddToCardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAddToCardView(price: 210, productCount: 2, action: {})
    }
}

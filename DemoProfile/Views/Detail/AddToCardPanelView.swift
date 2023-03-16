//
//  AddToCardPanelView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct AddToCardPanelView: View {
    
    let price: Int
    @State private var productCount = 1
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                // MARK: - plus / minus
                VStack(alignment: .leading, spacing: 8) {
                    Text("Quantity:")
                        .foregroundColor(.colorTheme.profileSecondary)
                        .fontMontserrat(weight: .medium, size: 8)
                    
                    HStack(spacing: 20.0) {
                        ButtonPlusMinusView(systemName: "minus") {
                            if productCount >= 1 {
                                productCount -= 1
                            }
                        }
                        ButtonPlusMinusView(systemName: "plus") {
                            productCount += 1
                        }
                    }
                }
                
                Spacer()
                
                ButtonAddToCardView(price: price * productCount, productCount: productCount) {}
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 170)
        .background(Color.colorTheme.addToCardPanelBackground)
        .cornerRadius(35, corners: [.topRight, .topLeft])
    }
}




struct AddToCardPanelView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCardPanelView(price: 55)
    }
}

//
//  ButtonForBannerView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct ButtonForBannerView: View {
    
    let systemName: String
    let size: CGFloat
    let fontSize: CGFloat
    let weightFont: FontMontserrat.Weight
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .fontMontserrat(weight: weightFont, size: fontSize)
                .foregroundColor(.colorTheme.foregroundLatestButton)
                .background(
                    Color.colorTheme.backgroundIcon.opacity(0.9)
                        .frame(width: size, height: size)
                        .clipShape(Circle())
                )
                
        }
        

    }
}





struct ButtonForLatestView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonForBannerView(systemName: "plus",
                            size: 44,
                            fontSize: 16,
                            weightFont: .semibold,
                            action: {})
    }
}

//
//  HeaderCarouselView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct HeaderCarouselView: View {
    
    let title: String
    let action: () -> ()
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.colorTheme.text)
                .fontMontserrat(weight: .semibold, size: 14)
            Spacer()
            
            Button {
                action()
            } label: {
                Text("View all")
                    .foregroundColor(.colorTheme.iconTabBarInactive)
                    .fontMontserrat(weight: .semibold, size: 9)
            }
        }
    }
}




struct HeaderCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderCarouselView(title: "Latest", action: {})
            .padding()
    }
}

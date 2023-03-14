//
//  IconHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct IconHomeView: View {
    
    let item: Resources.HomeIcon
    
    var body: some View {
        VStack(spacing: 15.0) {
            Image(item.name)
                .renderingMode(.template)
                .foregroundColor(.colorTheme.text)
                .frame(width: 40, height: 40)
                .background(
                    Color.colorTheme.backgroundIcon.clipShape(Circle())
                )
            
            Text(item.name.capitalized)
                .foregroundColor(.colorTheme.homeSecondaryIcon)
                .fontMontserrat(weight: .medium, size: 8)
        }
    }
}




struct IconHomeView_Previews: PreviewProvider {
    static var previews: some View {
        IconHomeView(item: .furniture)
    }
}

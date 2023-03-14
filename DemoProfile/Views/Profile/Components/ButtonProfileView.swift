//
//  ButtonProfileView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 12/03/2023.
//

import SwiftUI

struct ButtonProfileView: View {
    
    let title: String
    let icon: Resources.ProfileIcon
    let price: String?
    let action: () -> ()
    
    var systemName: String {
        switch icon {
        case .card:
            return "chevron.forward"
        case .help:
            return ""
        case .logOut:
            return ""
        case .restore:
            return "chevron.forward"
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(icon.name)
                    .renderingMode(.template)
                    .frame(width: 40, height: 40)
                    .background(
                        Color.colorTheme.backgroundIcon.clipShape(Circle())
                    )
                Text(title)
                Spacer()
                if price != nil {
                    Text(price ?? "")
                } else {
                    Image(systemName: systemName)
                        .fontMontserrat(weight: .bold, size: 18)
                }
            }
            .fontMontserrat(weight: .medium, size: 14)
            .foregroundColor(.colorTheme.text)
        }
    }
}




struct ButtonProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonProfileView(title: "Balance", icon: .card, price: "$ 1593", action: {})
            .padding()
    }
}

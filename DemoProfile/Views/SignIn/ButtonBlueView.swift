//
//  ButtonBlueView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct ButtonBlueView: View {
    
    let title: String
    let systemName: String
    let action: () -> ()
    
    init(title: String, systemName: String = "", action: @escaping () -> Void) {
        self.title = title
        self.systemName = systemName
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            Group {
                if !systemName.isEmpty {
                    HStack {
                        Spacer()
                        Image(systemName: systemName)
                        Spacer()
                        Text(title)
                        Spacer()
                        Spacer()
                    }
                } else {
                    Text(title)
                }
            }
            .foregroundColor(.colorTheme.foregroundColorButton)
            .fontMontserrat(weight: .bold, size: 15)
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.colorTheme.blue)
        .cornerRadius(15)
    }
}




struct ButtonBlueView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBlueView(title: "Sign in", systemName: "plus", action: {})
            .padding()
    }
}

//
//  MessageView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            Text("Message View")
                .fontMontserrat(weight: .medium, size: 24)
                .foregroundColor(.colorTheme.text)
        }
    }
}




struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}

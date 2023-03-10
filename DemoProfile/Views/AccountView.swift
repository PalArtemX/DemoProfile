//
//  AccountView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            Text("Account View")
                .fontMontserrat(weight: .regular, size: 27)
                .foregroundColor(.colorTheme.text)
        }
    }
}




struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

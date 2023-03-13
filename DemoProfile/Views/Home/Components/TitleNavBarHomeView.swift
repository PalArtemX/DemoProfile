//
//  TitleNavBarHomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct TitleNavBarHomeView: View {
    var body: some View {
        HStack {
            Text("Trade by")
                .foregroundColor(.colorTheme.text)
            Text("bata")
                .foregroundColor(.colorTheme.blue)
        }
        .fontMontserrat(weight: .bold, size: 20)
    }
}




struct TitleNavBarHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TitleNavBarHomeView()
    }
}

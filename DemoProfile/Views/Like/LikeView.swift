//
//  LikeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct LikeView: View {
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            Text("Like View")
                .fontMontserrat(weight: .medium, size: 24)
                .foregroundColor(.colorTheme.text)
        }
    }
}




struct LikeView_Previews: PreviewProvider {
    static var previews: some View {
        LikeView()
    }
}

//
//  HomeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            Text("Home View")
                .fontMontserrat(weight: .bold, size: 25)
                .foregroundColor(.colorTheme.text)
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

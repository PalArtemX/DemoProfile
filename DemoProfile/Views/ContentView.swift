//
//  ContentView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .fontMontserrat(weight: .bold, size: 14)
                .foregroundColor(.colorTheme.blue)
                .padding()
                .background(Color.colorTheme.background)
                .cornerRadius(10)
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

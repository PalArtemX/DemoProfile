//
//  ButtonSelectColorView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI

struct ButtonSelectColorView: View {
    
    let hex: String
    let select: Bool
    let action: () -> ()

    var body: some View {
        Text("Hello, World!")
    }
}

struct ButtonSelectColorView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSelectColorView(hex: "", select: true, action: {})
    }
}

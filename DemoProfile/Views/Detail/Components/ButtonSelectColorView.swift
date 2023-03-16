//
//  ButtonSelectColorView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 16/03/2023.
//

import SwiftUI

struct ButtonSelectColorView: View {
    
    let select: Int
    let hex: String
    let action: () -> ()
    
    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 34, height: 28)
                .foregroundColor(Color(hex: hex))
                .onTapGesture {
                    action()
                }
    }
}




struct ButtonSelectColorView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSelectColorView(select: 1, hex: "#b5b5b5", action: {})
    }
}

//
//  ButtonPlusMinusView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct ButtonPlusMinusView: View {
    
    let systemName: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: systemName)
                .foregroundColor(.white)
                .fontMontserrat(weight: .semibold, size: 9)
                .frame(width: 38, height: 22, alignment: .center)
                .background(Color.colorTheme.blue)
                .cornerRadius(8)
        }
    }
}




struct ButtonPlusMinusView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlusMinusView(systemName: "plus", action: {})
    }
}

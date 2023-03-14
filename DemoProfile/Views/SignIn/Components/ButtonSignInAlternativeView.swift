//
//  ButtonSignInAlternativeView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct ButtonSignInAlternativeView: View {
    
    let signIn: Resources.SignInWith
    let action: () -> ()
    
    init(with signIn: Resources.SignInWith, action: @escaping () -> Void) {
        self.signIn = signIn
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack(spacing: 20) {
                Image(signIn.icon)
                    .frame(width: 24, height: 24)
                
                Text("Sign in with \(signIn.name)")
                    .fontMontserrat(weight: .medium, size: 12)
                    .foregroundColor(.black)
            }
        }
    }
}




struct SignInWithView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonSignInAlternativeView(with: .apple, action: {})
    }
}

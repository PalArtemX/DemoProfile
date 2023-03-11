//
//  SignInPageView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct SignInPageView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                Text("Sign in")
                    .fontMontserrat(weight: .semibold, size: 25)
            
                Spacer()
                
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                
                TextFieldLoginView(text: $lastName, placeholder: "Last name")
                
                TextFieldLoginView(text: $email, placeholder: "Email")
                
                VStack(alignment: .leading, spacing: 18) {
                    ButtonBlueView(title: "Sign in") {
                        
                        // action
                    }
                    
                    AlreadyHaveAnAccountView {
                        
                        // action
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 48) {
                    ButtonSignInAlternativeView(with: .google) {
                        print("Sign in with Google")
                    }
                    ButtonSignInAlternativeView(with: .apple) {
                        print("Sign in with Apple")
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 44)
            
            
           
        }
    }
}




struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
    }
}

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
    
    private let paddingVTextField: CGFloat = 20
    
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack {
                
                Text("Sign in")
                    .fontMontserrat(weight: .semibold, size: 25)
                    .padding(.bottom, 50)
                
                
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                    .padding(.vertical, paddingVTextField)
                
                TextFieldLoginView(text: $lastName, placeholder: "Last name")
                    .padding(.vertical, paddingVTextField)
                
                TextFieldLoginView(text: $email, placeholder: "Last name")
                    .padding(.vertical, paddingVTextField)
                
                
            }
            .padding(30)
            
            
           
        }
    }
}




struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
    }
}

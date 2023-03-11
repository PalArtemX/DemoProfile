//
//  SignInPageView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct SignInPageView: View {
    
    private enum Field: Hashable {
        case firstName
        case lastName
        case email
    }
    
    @FocusState private var focusedField: Field?
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @State private var isShowLoginView = false
    
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                Text("Sign in")
                    .fontMontserrat(weight: .semibold, size: 25)
            
                Spacer()
                
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                    .focused($focusedField, equals: .firstName)
                
                TextFieldLoginView(text: $lastName, placeholder: "Last name")
                    .focused($focusedField, equals: .lastName)
                
                TextFieldLoginView(text: $email, placeholder: "Email")
                    .focused($focusedField, equals: .email)
                
                VStack(alignment: .leading, spacing: 18) {
                    ButtonBlueView(title: "Sign in") {
                        print("blue button")
                    }
                    
                    AlreadyHaveAnAccountView {
                        isShowLoginView.toggle()
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
        .sheet(isPresented: $isShowLoginView) {
            LoginView()
        }
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button {
                    focusedField = nil
                } label: {
                    Label("Down", systemImage: "keyboard.chevron.compact.down")
                }
            }
            ToolbarItem(placement: .keyboard) {
                Button {
                    if focusedField == .firstName {
                        focusedField = .lastName
                    } else if focusedField == .lastName {
                        focusedField = .email
                    } else if focusedField == .email {
                        focusedField = .firstName
                    }
                } label: {
                    Label("Next", systemImage: "arrow.turn.down.left")
                }
            }
        }
    }
}




struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
    }
}

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
    
    @EnvironmentObject var signInViewModel: SignInViewModel
    @FocusState private var focusedField: Field?
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    
    @State private var isShowLoginView = false
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                Text("Sign in")
                    .foregroundColor(.colorTheme.text)
                    .fontMontserrat(weight: .semibold, size: 25)
                Spacer()
                
                // MARK: - TextFields
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                    .focused($focusedField, equals: .firstName)
                TextFieldLoginView(text: $lastName, placeholder: "Last name")
                    .focused($focusedField, equals: .lastName)
                TextFieldLoginView(text: $email, placeholder: "Email")
                    .focused($focusedField, equals: .email)
                
                // MARK: - Button Sign in
                VStack(alignment: .leading, spacing: 18) {
                    ButtonBlueView(title: "Sign in") {
                        if signInViewModel.registrationUser(firstName: firstName, lastName: lastName, email: email.lowercased()) {
                            firstName = ""
                            lastName = ""
                            email = ""
                            focusedField = nil
                        }
                    }
                    AlreadyHaveAnAccountView {
                        isShowLoginView.toggle()
                    }
                }
                Spacer()
                
                // MARK: - Sign In Google and Apple
                VStack(alignment: .leading, spacing: 48) {
                    ButtonSignInAlternativeView(with: .google) { }
                    ButtonSignInAlternativeView(with: .apple) { }
                }
                Spacer()
            }
            .padding(.horizontal, 44)
        }
        .alert(isPresented: $signInViewModel.showAlert) {
            Alert(title: Text(signInViewModel.titleAlert),
                  message: Text(signInViewModel.messageAlert))
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
            .environmentObject(SignInViewModel())
    }
}

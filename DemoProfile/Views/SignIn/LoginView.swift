//
//  LoginView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    private enum Field: Hashable {
        case firstName
        case password
    }
    
    @EnvironmentObject var signInViewModel: SignInViewModel
    @FocusState private var focusedField: Field?
    @State private var firstName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            // MARK: - Background
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                Text("Welcome back")
                    .foregroundColor(.colorTheme.text)
                    .fontMontserrat(weight: .semibold, size: 25)
                
                Spacer()
                
                // MARK: - Textfields
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                    .focused($focusedField, equals: .firstName)
                
                SecureFieldLoginView(text: $password, placeholder: "Password")
                    .focused($focusedField, equals: .password)
                
                Spacer()
                Spacer()
                
                // MARK: - Button Login
                ButtonBlueView(title: "Login") {
                    if signInViewModel.loginUser(firstName: firstName, password: password.lowercased()) {
                        firstName = ""
                        password = ""
                        focusedField = nil
                    }
                }
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 44)
            
        }
        .alert(isPresented: $signInViewModel.showAlert) {
            Alert(title: Text(signInViewModel.titleAlert),
                  message: Text(signInViewModel.messageAlert))
        }
        
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(SignInViewModel())
    }
}

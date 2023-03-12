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
    
    @EnvironmentObject var demoProfileViewModel: SignInViewModel
    @FocusState private var focusedField: Field?
    @State private var firstName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                Text("Welcome back")
                    .foregroundColor(.colorTheme.text)
                    .fontMontserrat(weight: .semibold, size: 25)
                
                Spacer()
                
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                    .focused($focusedField, equals: .firstName)
                SecureFieldLoginView(text: $password, placeholder: "Password")
                    .focused($focusedField, equals: .password)
                
                Spacer()
                Spacer()
                
                ButtonBlueView(title: "Login") {
                    if demoProfileViewModel.loginUser(firstName: firstName, password: password.lowercased()) {
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
        .alert(isPresented: $demoProfileViewModel.showAlert) {
            Alert(title: Text(demoProfileViewModel.titleAlert),
                  message: Text(demoProfileViewModel.messageAlert))
        }
        
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(SignInViewModel())
    }
}

//
//  LoginView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var demoProfileViewModel: DemoProfileViewModel
    
    @State private var firstName = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.colorTheme.background.ignoresSafeArea()
            
            VStack(spacing: 35) {
                Spacer()
                Text("Welcome back")
                    .fontMontserrat(weight: .semibold, size: 25)
                
                Spacer()
                
                TextFieldLoginView(text: $firstName, placeholder: "First name")
                
                SecureFieldLoginView(text: $password, placeholder: "Password")
                
                Spacer()
                Spacer()
                
                ButtonBlueView(title: "Login") {
                    demoProfileViewModel.userLoggedIn = true
                }
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 44)
            
        }
        
    }
}






struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(DemoProfileViewModel())
    }
}

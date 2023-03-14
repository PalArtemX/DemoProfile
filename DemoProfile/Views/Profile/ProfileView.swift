//
//  ProfileView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var signInViewModel: SignInViewModel
    @State private var isShowAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: - Background
                Color.colorTheme.background.ignoresSafeArea()
                
                ScrollView {
                    VStack {
                        
                        // MARK: - Photo User
                        VStack(spacing: 12) {
                            PhotoUserView()
                            ButtonChangePhotoView()
                        }
                        .padding(.top)
                        
                        // MARK: - User name
                        Text("Satria Adhi Pradana")
                            .foregroundColor(.colorTheme.profileUserName)
                            .fontMontserrat(weight: .bold, size: 15)
                            .padding()
                        
                        // MARK: - Blue Button
                        ButtonBlueView(title: "Upload item", systemName: "square.and.arrow.up") {}
                            .padding()
                            .padding(.horizontal)
                        
                        // MARK: - Buttons
                        VStack(spacing: 25) {
                            ButtonProfileView(title: "Trade store", icon: .card, price: nil) {}
                            ButtonProfileView(title: "Payment method", icon: .card, price: nil) {}
                            ButtonProfileView(title: "Balance", icon: .card, price: "$ 1593") {}
                            ButtonProfileView(title: "Trade history", icon: .card, price: nil) {}
                            ButtonProfileView(title: "Restore Purchase", icon: .restore, price: nil) {}
                            ButtonProfileView(title: "Help", icon: .help, price: nil) {}
                            ButtonProfileView(title: "Log out", icon: .logOut, price: nil) {
                                isShowAlert.toggle()
                            }
                        }
                        .padding()
                        
                        .navigationBarTitleDisplayMode(.inline)
                        Spacer()
                    }
                    .alert("Log out?", isPresented: $isShowAlert, actions: {
                        Button("Ok") {
                            signInViewModel.logOut()
                        }
                        Button("Cancel", role: .cancel) {
                            isShowAlert.toggle()
                        }
                    })
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                // action
                            } label: {
                                Image(systemName: "arrow.left")
                                    .fontMontserrat(weight: .bold, size: 15)
                                    .foregroundColor(.black)
                            }
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Profile")
                                .fontMontserrat(weight: .bold, size: 15)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
    }
}




struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ProfileViewModel())
            .environmentObject(SignInViewModel())
    }
}

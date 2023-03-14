//
//  SecureFieldLoginView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct SecureFieldLoginView: View {
    
    private enum Field: Hashable {
        case text
    }
    
    @FocusState private var focusedField: Field?
    @State private var hiddenPassword = true
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        ZStack {
            // MARK: - TextField
            ZStack {
                HStack {
                    Group {
                        if !hiddenPassword {
                            HStack {
                                TextField("", text: $text)
                                    .focused($focusedField, equals: .text)
                                Button {
                                    hiddenPassword.toggle()
                                } label: {
                                    Image(systemName: hiddenPassword ? "eye.slash.fill" : "eye")
                                        .symbolRenderingMode(.hierarchical)
                                }
                            }
                        } else {
                            HStack {
                                SecureField("", text: $text)
                                    .focused($focusedField, equals: .text)
                                Button {
                                    hiddenPassword.toggle()
                                } label: {
                                    Image(systemName: hiddenPassword ? "eye.slash.fill" : "eye")
                                        .symbolRenderingMode(.hierarchical)
                                }
                            }
                        }
                    }
                    .padding()
                    .frame(height: 33)
                    .fontMontserrat(weight: .medium, size: 14)
                    .foregroundColor(.colorTheme.text)
                    .background(
                        Color.colorTheme.backgroundLoginTextField
                    )
                    .clipShape(Capsule())
                }
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.colorTheme.textSecondary.opacity(0.8))
                        .fontMontserrat(weight: .medium, size: 12)
                        .onTapGesture {
                            focusedField = .text
                        }
                }
            }
        }
    }
}




struct SecureFieldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        SecureFieldLoginView(text: .constant("text"), placeholder: "placeholder")
            .padding()
    }
}

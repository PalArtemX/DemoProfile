//
//  TextFieldLoginView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct TextFieldLoginView: View {
    
    enum Field: Hashable {
        case text
    }
    
    @FocusState private var focusedField: Field?
    @State private var hiddenPassword = false
    @Binding var text: String
    
    let placeholder: String
    let hiddenPasswordIcon: Bool
    let actionHiddenPassword: () -> ()
    
    init(hiddenPassword: Bool = false, text: Binding<String>, placeholder: String, hiddenPasswordIcon: Bool = false, actionHiddenPassword: @escaping () -> () = {}) {
        self.hiddenPassword = hiddenPassword
        _text = text
        self.placeholder = placeholder
        self.hiddenPasswordIcon = hiddenPasswordIcon
        self.actionHiddenPassword = actionHiddenPassword
    }
    
    var body: some View {
        ZStack {
            // MARK: - TextField
            ZStack {
                TextField("", text: $text)
                    .focused($focusedField, equals: .text)
                    .fontMontserrat(weight: .semibold, size: 16)
                    .foregroundColor(.colorTheme.text)
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(
                        Color.colorTheme.backgroundLoginTextField
                    )
                    .clipShape(Capsule())
                
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(.colorTheme.textSecondary.opacity(0.8))
                        .fontMontserrat(weight: .regular, size: 15)
                        .onTapGesture {
                            focusedField = .text
                        }
                }
            }
            
            // MARK: - hiddenPasswordIcon
            if hiddenPasswordIcon {
                HStack {
                    Spacer()
                    Button {
                        actionHiddenPassword()
                        hiddenPassword.toggle()
                    } label: {
                        Image(systemName: hiddenPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.colorTheme.text)
                            .symbolRenderingMode(.hierarchical)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}




struct TextFieldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldLoginView(text: .constant(""), placeholder: "Last name", hiddenPasswordIcon: false, actionHiddenPassword: {})
            .padding()
    }
}

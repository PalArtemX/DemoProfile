//
//  TextFieldLoginView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct TextFieldLoginView: View {
    
    private enum Field: Hashable {
        case text
    }
    
    @FocusState private var focusedField: Field?
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
            ZStack {
                TextField("", text: $text)
                    .focused($focusedField, equals: .text)
                    .padding()
                    .frame(height: 33)
                    .fontMontserrat(weight: .medium, size: 14)
                    .foregroundColor(.colorTheme.text)
                    .background(
                        Color.colorTheme.backgroundLoginTextField
                    )
                    .clipShape(Capsule())
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




struct TextFieldLoginView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldLoginView(text: .constant(""), placeholder: "placeholder")
            .padding()
    }
}

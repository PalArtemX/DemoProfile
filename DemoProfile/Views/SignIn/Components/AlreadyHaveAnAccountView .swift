//
//  AlreadyHaveAnAccountView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 11/03/2023.
//

import SwiftUI

struct AlreadyHaveAnAccountView: View {
    
    let action: () -> ()
    
    var body: some View {
        HStack {
            Text("Already have an account?")
                .foregroundColor(.colorTheme.textSecondary)
            Button("Log in") {
                action()
            }

        }
        .fontMontserrat(weight: .medium, size: 10)
    }
}




struct AlreadyHaveAnAccountView__Previews: PreviewProvider {
    static var previews: some View {
        AlreadyHaveAnAccountView(action: {})
    }
}

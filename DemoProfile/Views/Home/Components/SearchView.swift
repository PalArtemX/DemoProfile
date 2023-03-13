//
//  SearchView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 13/03/2023.
//

import SwiftUI

struct SearchView: View {
    
    private enum Field: Hashable {
        case search
    }
    @FocusState private var focusedField: Field?
    @State private var search = ""
    
    var body: some View {
        ZStack {
            
            HStack {
                // MARK: - TexField
                TextField("", text: $search)
                    .focused($focusedField, equals: .search)
                    .padding()
                
                // MARK: - Button search
                Button {
                    // action
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.colorTheme.homeSecondary)
                }
                .padding()

            }
            .frame(height: 33)
            .fontMontserrat(weight: .medium, size: 12)
            .foregroundColor(.colorTheme.text)
            .background(
                Color.colorTheme.backgroundSearch
            )
            .clipShape(Capsule())
            
            // MARK: - Placeholder
            if search.isEmpty {
                Text("What are you looking for ?")
                    .foregroundColor(.colorTheme.homeSecondary.opacity(0.9))
                    .fontMontserrat(weight: .regular, size: 12)
                    .onTapGesture {
                        focusedField = .search
                    }
            }
        }
    }
}





struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .padding()
    }
}

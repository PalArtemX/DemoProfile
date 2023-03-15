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
    @EnvironmentObject var homeViewModel: HomeViewModel
    @FocusState private var focusedField: Field?
 
    var body: some View {
        VStack {
            ZStack {
                
                HStack {
                    // MARK: - TexField
                    TextField("", text: $homeViewModel.searchField)
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
                if homeViewModel.searchField.isEmpty {
                    Text("What are you looking for ?")
                        .foregroundColor(.colorTheme.homeSecondary.opacity(0.9))
                        .fontMontserrat(weight: .regular, size: 12)
                        .onTapGesture {
                            withAnimation(.default) {
                                focusedField = .search
                            }
                        }
                }
                
            }
            // MARK: - Search List
            if homeViewModel.isShowSearch {
                List {
                    if homeViewModel.resultSearch.isEmpty {
                        ProgressView()
                    } else {
                        ForEach(homeViewModel.resultSearch, id: \.self) { text in
                            Text(text)
                                .fontMontserrat(weight: .medium, size: 14)
                                .onTapGesture {
                                    withAnimation(.default) {
                                        homeViewModel.searchField = text
                                        homeViewModel.isShowSearch = false
                                    }
                                }
                        }
                    }
                }
                .cornerRadius(20, corners: [.bottomLeft, .bottomRight])
                .frame(height: 130)
                .listStyle(.plain)
            }
        }
    }
}





struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(HomeViewModel(dataServices: NetworkManager()))
            .padding()
    }
}

//
//  TabBarView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct TabBarView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    private let cornerRadius: CGFloat = 35
    let content: Content
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
                VStack {
                    Spacer()
                    TabBarItemView(selector: $selection, tabs: tabs)
                        .cornerRadius(cornerRadius, corners: [.topRight, .topLeft])
                        .ignoresSafeArea()
                }
            }
            
        }
        .ignoresSafeArea()
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

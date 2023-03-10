//
//  TabBarItemView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct TabBarItemView: View {
    
    private let matchedGeometryEffectId = "CircleTavBar"
    private let cornerRadius: CGFloat = 37
    private let paddingBottom: CGFloat = 5
    
    @Namespace private var namespace
    @Binding var selector: TabBarItem
    let tabs: [TabBarItem]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    ForEach(tabs, id: \.self) { tab in
                        Spacer()
                        tabView(tab: tab)
                            .padding(.bottom, paddingBottom)
                            .onTapGesture {
                                switchToTab(tab: tab)
                            }
                        Spacer()
                    }
                }
                .padding()
                .background(
                    Color.white.ignoresSafeArea(.all, edges: .bottom)
                )
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
            }
        }
        .background(Color.colorTheme.background)
        
    }
}


extension TabBarItemView {
    
    private func tabView(tab: TabBarItem) -> some View {
        Image(tab.iconName)
            .renderingMode(.template)
            .foregroundColor(
                selector == tab ? .colorTheme.iconTabBarActive : .colorTheme.iconTabBarInactive
            )
            .padding()
            .background(
                ZStack {
                    if selector == tab {
                        Color.colorTheme.backgroundIconTabBar.clipShape(Circle())
                            .matchedGeometryEffect(id: matchedGeometryEffectId, in: namespace)
                    }
                }
            )
            .padding(.bottom)
    }
    
    private func switchToTab(tab: TabBarItem) {
        withAnimation() {
            selector = tab
        }
    }
}




struct TabBarView_Previews: PreviewProvider {
    
    static let tabs = [TabBarItem.house, .basket, .message, .account]
    
    static var previews: some View {
            TabBarItemView(selector: .constant(tabs.first!), tabs: tabs)

    }
}

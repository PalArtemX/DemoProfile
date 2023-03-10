//
//  FontMontserrat.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 10/03/2023.
//

import SwiftUI

struct FontMontserrat: ViewModifier {
    
    enum Weight: String {
        case bold = "Montserrat-Bold"
        case regular = "Montserrat-Regular"
        case semibold = "Montserrat-SemiBold"
    }
    
    let weight: Weight
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(weight.rawValue, size: size))
    }
}


extension View {
    
    /// Sets the font Montserrat
    func fontMontserrat(weight: FontMontserrat.Weight = .regular, size: CGFloat) -> some View {
        modifier(FontMontserrat(weight: weight, size: size))
    }
    
}

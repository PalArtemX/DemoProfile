//
//  ColorPickerDetailView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct ColorPickerDetailView: View {
    
    @State private var selection = 0
    let hexColors: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Color:")
                .fontMontserrat(weight: .semibold, size: 10)
                .foregroundColor(.colorTheme.profileSecondary)
            
            HStack(spacing: 14.0) {
                ForEach(hexColors, id: \.self) { hex in
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 34, height: 28)
                        .foregroundColor(Color(hex: hex))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 4)
                                .cornerRadius(10)
                                .foregroundColor(.colorTheme.profileSecondary)
                                .frame(width: 34, height: 28)
                        }
                        .onTapGesture {
                            
                        }
                }
            }
        }
    }
}




struct ColorPickerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.colorTheme.background
            
            ColorPickerDetailView(hexColors: ["#ffffff", "#b5b5b5", "#000000"])
        }
    }
}

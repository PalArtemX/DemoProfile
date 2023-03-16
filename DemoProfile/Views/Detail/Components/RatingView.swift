//
//  RatingView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 15/03/2023.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Double
    let numberOfReviews: Int
    
    var body: some View {
        HStack {
            Image(systemName: "star")
                .foregroundColor(.yellow)
            
            Text("\(String(format:"%.1f", rating))")
                .foregroundColor(.colorTheme.text)
            
            Text("(\(numberOfReviews) reviews)")
                .foregroundColor(.colorTheme.profileSecondary)
        }
        .fontMontserrat(weight: .semibold, size: 10)
    }
}




struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.7, numberOfReviews: 3500)
    }
}

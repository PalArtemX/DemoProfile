//
//  ImageForBannerView.swift
//  DemoProfile
//
//  Created by Artem Paliutin on 14/03/2023.
//

import SwiftUI

struct ImageForBannerView: View {
    var body: some View {
        Image("imageForBanner")
            .resizable()
            .frame(width: 25, height: 25)
    }
}




struct ImageForBannerView_Previews: PreviewProvider {
    static var previews: some View {
        ImageForBannerView()
    }
}

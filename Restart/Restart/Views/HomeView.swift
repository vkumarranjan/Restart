//
//  HomeView.swift
//  Restart
//
//  Created by vinay Kumar ranjan on 15/04/24.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboading") var isOnBoardingViewActive: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnBoardingViewActive = true
            }, label: {
                Text("Restart")
            })
        }
    }
}

#Preview {
    HomeView()
}

//
//  ContentView.swift
//  Restart
//
//  Created by vinay Kumar ranjan on 09/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboading") var isOnBoardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if  isOnBoardingViewActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}

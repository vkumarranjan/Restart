//
//  HomeView.swift
//  Restart
//
//  Created by vinay Kumar ranjan on 15/04/24.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboading") var isOnBoardingViewActive: Bool = false
    @State private var isAnimation: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            //: MARK Header
            Spacer()
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimation ? 35 : -35)
                    .animation(
                      Animation
                        .easeOut(duration: 4)
                        .repeatForever()
                      , value: isAnimation
                    )
            }
            
            //: MARK Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            //: MARK Footer
            
            Spacer()
            
            Button(action: {
                withAnimation{
                    isOnBoardingViewActive = true
                }
            }) {
            Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimation = true

            })
            
        })
    }
}

#Preview {
    HomeView()
}

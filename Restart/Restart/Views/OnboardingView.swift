//
//  OnboardingView.swift
//  Restart
//
//  Created by vinay Kumar ranjan on 15/04/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboading") var isOnBoardingViewActive: Bool = true

    var body: some View {
        
        ZStack {
            Color("ColorBule")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack(spacing: 0){
                  Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
                      It's not how much we give but
                      how much love we put into giving.
                     """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: Header
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
                
                
                
                // MARK: - FOOTER

                ZStack {
                    // PARTS of the custom button
                    
                    //1: Background(Static)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    //2: Callto-Action (Static)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    //3: Capsule(DynamicWidth)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()
                    }
                    //4: Circle(Draggable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                    .frame(width: 80, height: 80, alignment: .center)
                    .onTapGesture {
                        isOnBoardingViewActive = false
                    }
                        Spacer()
                    } //: HSTACK
                    
                    
                } //: FOOTER
                .frame(height: 80, alignment: .center)
                .padding()
            }  //: VSTACK
        }  //: ZSTACK
    }
}

#Preview {
    OnboardingView()
}

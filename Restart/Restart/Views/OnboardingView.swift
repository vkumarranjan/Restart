//
//  OnboardingView.swift
//  Restart
//
//  Created by vinay Kumar ranjan on 15/04/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboading") var isOnBoardingViewActive: Bool = true

    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimation: Bool = false
    @State private var imageOffset: CGSize = .zero///CGSize(width: 0, height: 0)
    
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
                .opacity(isAnimation ? 1 : 0)
                .offset(y: isAnimation ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimation)
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimation ? 1 : 0)
                        .animation(.easeInOut(duration: 0.5), value: isAnimation)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture (
                        DragGesture()
                            .onChanged { gesture in
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                }
                            }
                            .onEnded { _ in
                                imageOffset = .zero
                            }
                        ) //: Gesture
                        .animation(.easeOut(duration: 1), value: imageOffset)
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
                            .frame(width: buttonOffset + 80)
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
                    .offset(x: buttonOffset)
                    .gesture(
                    DragGesture()
                        .onChanged{ gesture in
                            if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                buttonOffset = gesture.translation.width
                            }
                        }
                        .onEnded{ _ in
                            withAnimation(Animation.easeInOut(duration: 0.4)) {
                                if buttonOffset > buttonWidth / 2 {
                                    buttonOffset = buttonWidth - 80
                                    isOnBoardingViewActive = false
                                } else {
                                    buttonOffset = 0
                                }
                            }
                        }
                    )// : Gesture
                        Spacer()
                } //: HSTACK
                    
                    
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimation ? 1 : 0)
                .offset(y: isAnimation ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimation)
                
            }  //: VSTACK
        }  //: ZSTACK
        .onAppear(perform: {
         isAnimation = true
        })
            
        
    }
}

#Preview {
    OnboardingView()
}

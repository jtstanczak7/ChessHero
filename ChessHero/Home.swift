//
//  Home.swift
//  ChessHero
//
//  Created by Jonathan Stanczak on 5/5/24.
//

import Foundation
import SwiftUI

struct HomePageView: View {
    
    @State private var imageScale: CGFloat = 1.0  // initial scale of the logo
    
    var body: some View {
        
        
        ZStack { // background gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(1.2)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Button(action: {
                    print("Button tapped!")
                }) {
                    Image("Start Button") // Replace "buttonImage" with the name of your image in the asset catalog
                        .resizable() // Make the image resizable
                        .scaledToFit() // Scale the image to fit its content
                        .frame(width: 500, height: 1000) // Set the frame of the image
                        .scaleEffect(imageScale)
                        .shadow(color: .black, radius: 5, x: 0, y: 2)
                        .onAppear {
                            withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                imageScale = 1.02  // Adjust scale from 1.0 to 1.1, bounce effect
                            }
                        }
                        .padding(.bottom, 400) // Add padding around the button for better tapability
                }
            }
        }
    }
    
}

#Preview {
    HomePageView()
}

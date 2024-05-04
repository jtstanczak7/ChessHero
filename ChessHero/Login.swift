//
//  Login.swift
//  ChessHero
//
//  Created by Jonathan Stanczak on 5/3/24.
//

import SwiftUI
import AuthenticationServices
import AVFoundation

struct LoginPageView: View {
    
    let logoImage = "ChessHero" // image from Assets
    @State private var logoScale: CGFloat = 1.0  // initial scale of the logo
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        ZStack { // background gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue.opacity(1.2)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack { // vertical stack of images and buttons
                Image(logoImage)  // Logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)
                    .scaledToFit()
                    .padding(.bottom, 50) // y value changes spacing between logo and button
                    .scaleEffect(logoScale)
                    .shadow(color: .white, radius: 5, x: 0, y: 2)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            logoScale = 1.1  // Adjust scale from 1.0 to 1.1, bounce effect
                        }
                        playBackgroundMusic()
                    }

                Button(action: { // Sign in button
                    // Action for the button
                    print("Sign in with Apple tapped") // temp
                }) {
                    HStack {
                        Image(systemName: "applelogo") // Apple logo from SF Symbols
                            .font(.title)
                        Text("Sign in with Apple")
                            .foregroundColor(.black)
                            .bold()
                    }
                    .frame(width: 280, height: 50)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: 0, y: 2)
                }
            }
        }
        .preferredColorScheme(.light)  // Force light mode
    }
    
    // Function to start playing music
    private func playBackgroundMusic() {
        let soundURL = Bundle.main.url(forResource: "Track1", withExtension: "mp3")
        guard let url = soundURL else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            player?.numberOfLoops = -1  // Loop indefinitely
        } catch {
            print("Unable to play background music: \(error)")
        }
    }
    
    // Function to stop playing music
    private func stopBackgroundMusic() {
        player?.stop()
    }
    
    
    
}
    

#Preview {
    LoginPageView()
}

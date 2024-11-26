//
//  DecorativeHeader.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
// Le header avec une animation néon en panne

import SwiftUI

struct DecorativeHeaderView: View {
    @State private var shadowIntensity: Double = 20 // État pour gérer l'intensité de l'ombre
    @State private var shadowOpacity: Double = 0.8 // État pour l'opacité de l'ombre
    @State private var isFlickering: Bool = true // État pour gérer l'arrêt de l'animation

    var body: some View {
        ZStack {
            // Ellipse décorative avec ombre animée
            Rectangle()
                .fill(Color("AccentColor"))
                .clipShape(Ellipse())
                .frame(height: 150)
                .offset(y: -100) // Positionner l'ellipse derrière
                .shadow(color: .orange.opacity(shadowOpacity), radius: shadowIntensity)
                .onAppear {
                    startFlickeringEffect() // Démarrer l'effet néon
                }
            
            // Photo de profil
            Image("me")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.purple, lineWidth: 2))
                .shadow(radius: 10)
        }
    }

    // Fonction pour démarrer l'effet de néon en panne
    func startFlickeringEffect() {
        var flickerCount = 0 // Compteur pour limiter le clignotement
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if isFlickering && flickerCount < 20 { // Limiter à 15 cycles (environ 3 secondes)
                flickerCount += 1
                withAnimation(Animation.easeInOut(duration: Double.random(in: 0.1...0.3))) {
                    shadowIntensity = Double.random(in: 10...30)
                    shadowOpacity = Double.random(in: 0.3...0.9)
                }
            } else {
                timer.invalidate() // Arrêter le Timer
                isFlickering = false
                withAnimation(Animation.easeOut(duration: 1.0)) {
                    shadowIntensity = 5 // Réduire l'intensité de l'ombre
                    shadowOpacity = 0.1 // Rendre l'ombre presque invisible
                }
            }
        }
    }
}

#Preview {
    DecorativeHeaderView()
}

//
//  ShareButton.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
//Le bouton de partage avec animation

import SwiftUI

struct ShareButtonView: View {
    @State private var isAnimating: Bool = false // État pour gérer l'animation

    var body: some View {
        Button {
            guard let messageAppURL = URL(string: "sms:&body=Bonjour,\nCliquez ici pour voir ma carte de visite : https://cvmanomikus.netlify.app.\nA bientôt,\nEtien")
            else { return }
            if UIApplication.shared.canOpenURL(messageAppURL) {
                UIApplication.shared.open(messageAppURL)
            }
        } label: {
            HStack {
                Text("Partager")
                Image(systemName: "arrow.up.right")
            }
            .padding()
            .background(
                isAnimating ? Color.orange.opacity(0.8) : Color("AccentColor")
            )
            .foregroundColor(isAnimating ? .white : .orange)
            .bold()
            .cornerRadius(30)
            .shadow(color: .orange, radius: isAnimating ? 10 : 2)
            .scaleEffect(isAnimating ? 1.1 : 1.0) // Pulsation
            .animation(
                Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true),
                value: isAnimating
            )
        }
        .onAppear {
            isAnimating = true // Démarrer l'animation à l'apparition
        }
    }
}

#Preview {
    ShareButtonView()
}

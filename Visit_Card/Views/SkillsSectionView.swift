//
//  SkillsSection.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
// La liste des compétences avec des étoiles de notation

import SwiftUI

struct SkillsSectionView: View {
    let skills: [skills]
    
    @State private var flicker: Bool = false // État pour gérer le scintillement
    @State private var isStable: Bool = false // État pour stabiliser les étoiles après scintillement

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(skills) { skill in
                HStack {
                    // Nom de la compétence
                    Text(skill.name)
                        .font(.headline)
                    
                    Spacer()
                    
                    // Étoiles de notation avec animation
                    HStack {
                        ForEach(0..<5) { index in
                            let starType = getStarType(for: index, rating: skill.rating)
                            Image(systemName: starType)
                                .foregroundColor(.purple)
                                .opacity(isStable ? 1.0 : (flicker ? 1.0 : 0.5)) // Stabiliser ou scintiller
                                .scaleEffect(isStable ? 1.0 : (flicker ? 1.2 : 1.0)) // Stabiliser ou effet de zoom
                                .animation(
                                    isStable ? .none : Animation.easeInOut(duration: Double.random(in: 0.5...1.0))
                                        .repeatForever(autoreverses: true),
                                    value: flicker
                                )
                        }
                    }
                }
            }
        }
        .onAppear {
            startFlickeringEffect() // Démarrer l'animation
        }
    }
    
    // Fonction pour gérer le scintillement et l'arrêt naturel
    private func startFlickeringEffect() {
        flicker = true
        
        // Arrêter le scintillement après 3 secondes
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            flicker = false
            withAnimation(Animation.easeOut(duration: 1.0)) {
                isStable = true // Stabiliser les étoiles
            }
        }
    }
    
    // Fonction pour déterminer le type d'étoile
    private func getStarType(for index: Int, rating: Double) -> String {
        let lowerBound = Double(index)
        let upperBound = lowerBound + 1.0

        if rating >= upperBound {
            return "star.fill" // Étoile remplie
        } else if rating > lowerBound {
            return "star.leadinghalf.filled" // Étoile partiellement remplie
        } else {
            return "star" // Étoile vide
        }
    }
}

#Preview {
    SkillsSectionView(skills: [
        skills(name: "SwiftUI", rating: 4.5),
        skills(name: "Xcode", rating: 3.2),
        skills(name: "GitHub", rating: 1.8)
    ])
}

//
//  MainInfoView.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
//Les informations principales (nom, métier, “Open to work”)

import SwiftUI

struct MainInfoView: View {
    var body: some View {
        VStack(spacing: 10) {
            // Nom complet
            Text("Etien MANOUAN")
                .font(.title)
                .foregroundColor(Color(white: 0.2))
                .bold()
            
            // Métier et statut
            HStack {
                Text("Développeur iOS")
                    .font(.headline)
                    .foregroundColor(Color(white: 0.5))
                    .bold()
                Spacer()
                Text("Open to work")
                    .padding(8)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .bold()
                    .background(Color.purple)
                    .cornerRadius(20)
            }
        }
    }
}
#Preview {
    MainInfoView()
}

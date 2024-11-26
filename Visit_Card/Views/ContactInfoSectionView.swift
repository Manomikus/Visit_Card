//
//  ContactInfoSection.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
//La liste des informations de contact (email, lien, téléphone)

import SwiftUI

struct ContactInfoSectionView: View {
    let infos: [contactInfos]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(infos) { info in
                HStack {
                    // Icône circulaire
                    Image(info.icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(Color("AccentColor"))
                        .clipShape(Circle())
                    
                    // Texte d'information
                    Text(info.text)
                        .foregroundColor(.blue)
                    
                    Spacer()
                }
            }
        }
    }
}
#Preview {
    ContactInfoSectionView(infos: [
         contactInfos(icon: "enveloppe", text: "manouanec@gmail.com"),
         contactInfos(icon: "link", text: "https://github.com/Manomikus"),
         contactInfos(icon: "phone", text: "+336 17 96 47 10")
     ])
}

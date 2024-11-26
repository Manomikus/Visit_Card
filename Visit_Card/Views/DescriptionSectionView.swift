//
//  DescriptionSectionView.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
//

import SwiftUI

struct DescriptionSectionView: View {
    var body: some View {
        HStack{
            Text("Développeur passionné, j'accompagne les entreprises et les particuliers dans leurs projets du développement web à la création d’applications mobile.")
                .padding()
                .background(Color.gray.opacity(0.1))
                .border(Color.gray.opacity(0.2), width: 1)
                .cornerRadius(10)
            
        }
    }
}

#Preview {
    DescriptionSectionView()
}

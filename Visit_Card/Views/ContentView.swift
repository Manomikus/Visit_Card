//
//  ContentView.swift
//  Visit_card_Etien
//
//  Created by Manomike on 26/11/2024.
//Vue Principale

import SwiftUI

struct ContentView: View {
    let myInfos = [
        contactInfos(icon: "enveloppe", text: "manouanec@gmail.com"),
        contactInfos(icon: "link", text: "https://github.com/Manomikus"),
        contactInfos(icon: "phone", text: "+336 17 96 47 10")
    ]
    let mySkills = [
        skills(name: "SwiftUI", rating: 3.5),
        skills(name: "Xcode", rating: 4.5),
        skills(name: "GitHub", rating: 4.0)
    ]
    
    var body: some View {
        ScrollView {
            DecorativeHeaderView()
            VStack(spacing: 16) {
               
                MainInfoView()
                DescriptionSectionView()
                ContactInfoSectionView(infos: myInfos)
                SkillsSectionView(skills: mySkills)
                    .padding(.bottom,10)
                ShareButtonView()
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}

//
//  CharacterDetailView.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import Foundation
import SwiftUI

struct CharacterDetailView: View {
    @ObservedObject var viewModel: StarWarsDetailViewModel

    var body: some View {
        VStack(alignment: .leading) {
            if let character = viewModel.character {
                Text(character.name)
                    .font(.largeTitle)
                Text("Height: \(character.height) cm")
                Text("Mass: \(character.mass) kg")
                Text("Hair Color: \(character.hairColor)")
                Text("Skin Color: \(character.skinColor)")
                Text("Eye Color: \(character.eyeColor)")
                Text("Birth Year: \(character.birthYear)")
                Text("Gender: \(character.gender)")
            }
        }
        .padding()
        .navigationTitle("Character Details")
    }
}

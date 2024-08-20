//
//  ContentView.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/20/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = StarWarsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.headline)
                    Text("Height: \(character.height) cm")
                    Text("Mass: \(character.mass) kg")
                    Text("Birth Year: \(character.birthYear)")
                    Text("Gender: \(character.gender)")
                }
            }
            .navigationTitle("Star Wars Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

#Preview {
    ContentView()
}

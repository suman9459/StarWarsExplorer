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
            ZStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5, anchor: .center)
                        .padding()
                } else {
                    List(viewModel.characters) { character in
                        NavigationLink(
                            destination: CharacterDetailView(viewModel: StarWarsDetailViewModel(character: character))) {
                                Text(character.name)
                                    .font(.headline)
                            }
                    }
                }
            }
            .navigationTitle("Star Wars Characters")
            .onAppear {
                viewModel.fetchCharacters()
            }
            .toolbar {
                NavigationLink(destination: StarshipListView()) {
                    Text("Starships")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

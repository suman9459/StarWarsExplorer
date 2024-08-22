//
//  StarshipListView.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import Foundation
import SwiftUI

struct StarshipListView: View {
    @StateObject private var viewModel = StarshipViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5, anchor: .center)
                    .padding()
            } else {
                List(viewModel.starships) { starship in
                    VStack(alignment: .leading) {
                        Text(starship.name)
                            .font(.headline)
                        Text("Model: \(starship.model)")
                        Text("Manufacturer: \(starship.manufacturer)")
                        Text("Crew: \(starship.crew)")
                        Text("Passengers: \(starship.passengers)")
                    }
                }
            }
        }
        .navigationTitle("Starships")
        .onAppear {
            viewModel.fetchStarships()
        }
    }
}

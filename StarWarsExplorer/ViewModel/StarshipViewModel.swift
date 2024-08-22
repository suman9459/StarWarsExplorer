//
//  StarshipViewModel.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import Foundation
import Combine

class StarshipViewModel: ObservableObject {
    @Published var starships = [Starship]()
    @Published var isLoading = false
    private var cancellable: AnyCancellable?

    func fetchStarships() {
        isLoading = true
        let url = URL(string: "https://swapi.dev/api/starships/")!
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: StarshipResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching starships: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.starships = response.results
            })
    }
}

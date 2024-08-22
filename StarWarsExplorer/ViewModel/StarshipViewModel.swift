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
    private var cancellable: AnyCancellable?

    func fetchStarships() {
        let url = URL(string: "https://swapi.dev/api/starships/")!
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: StarshipResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching starships: \(error)")
                }
            }, receiveValue: { response in
                self.starships = response.results
            })
    }
}

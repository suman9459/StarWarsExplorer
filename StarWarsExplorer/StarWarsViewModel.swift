//
//  StarWarsViewModel.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/20/24.
//

import Foundation
import Combine

class StarWarsViewModel: ObservableObject {
    @Published var characters = [StarWarsCharacter]()
    private var cancellable: AnyCancellable?

    func fetchCharacters() {
        let url = URL(string: "https://swapi.dev/api/people/")!
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: StarWarsResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching characters: \(error)")
                }
            }, receiveValue: { response in
                self.characters = response.results
            })
    }
}

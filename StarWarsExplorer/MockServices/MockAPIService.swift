//
//  MockAPIService.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import Foundation
import Combine

class MockAPIService {
    func fetchCharacters() -> AnyPublisher<StarWarsResponse, Error> {
        let mockCharacters = [
            StarWarsCharacter(name: "Luke Skywalker", height: "172", mass: "77", hairColor: "Blond", skinColor: "Fair", eyeColor: "Blue", birthYear: "19BBY", gender: "Male")
        ]
        let response = StarWarsResponse(results: mockCharacters)
        return Just(response)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }

    func fetchStarships() -> AnyPublisher<StarshipResponse, Error> {
        let mockStarships = [
            Starship(name: "Millennium Falcon", model: "YT-1300 light freighter", manufacturer: "Corellian Engineering Corporation", costInCredits: "100000", length: "34.37", crew: "4", passengers: "6")
        ]
        let response = StarshipResponse(results: mockStarships)
        return Just(response)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

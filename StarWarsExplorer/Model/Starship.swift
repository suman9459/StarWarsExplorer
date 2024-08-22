//
//  Starship.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import Foundation

struct Starship: Identifiable, Codable {
    let id = UUID()
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String

    enum CodingKeys: String, CodingKey {
        case name, model, manufacturer
        case costInCredits = "cost_in_credits"
        case length, crew, passengers
    }
}

struct StarshipResponse: Codable {
    let results: [Starship]
}

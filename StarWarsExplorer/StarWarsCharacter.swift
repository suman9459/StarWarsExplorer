//
//  StarWarsCharacter.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/20/24.
//

import Foundation

struct StarWarsCharacter: Identifiable, Codable {
    let id = UUID()
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
    }
}

struct StarWarsResponse: Codable {
    let results: [StarWarsCharacter]
}

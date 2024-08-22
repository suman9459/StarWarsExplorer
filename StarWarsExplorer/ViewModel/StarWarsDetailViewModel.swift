//
//  StarWarsDetailViewModel.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import Foundation
import Combine

class StarWarsDetailViewModel: ObservableObject {
    @Published var character: StarWarsCharacter?

    init(character: StarWarsCharacter?) {
        self.character = character
    }
}

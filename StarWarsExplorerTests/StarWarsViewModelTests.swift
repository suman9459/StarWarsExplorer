//
//  StarWarsViewModelTests.swift
//  StarWarsExplorer
//
//  Created by Sai Suman Pothedar on 8/22/24.
//

import XCTest
import Combine
@testable import StarWarsExplorer

class StarWarsViewModelTests: XCTestCase {
    var viewModel: StarWarsViewModel!
    var cancellables: Set<AnyCancellable>!
    var mockService: MockAPIService!

    override func setUp() {
        super.setUp()
        mockService = MockAPIService()
        viewModel = StarWarsViewModel()
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchCharacters() {
        let expectation = XCTestExpectation(description: "Fetch characters")

        mockService.fetchCharacters()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { response in
                      XCTAssertEqual(response.results.count, 1)
                      XCTAssertEqual(response.results.first?.name, "Luke Skywalker")
                      expectation.fulfill()
                  })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5)
    }

    func testFetchStarships() {
        let expectation = XCTestExpectation(description: "Fetch starships")

        mockService.fetchStarships()
            .sink(receiveCompletion: { _ in },
                  receiveValue: { response in
                      XCTAssertEqual(response.results.count, 1)
                      XCTAssertEqual(response.results.first?.name, "Millennium Falcon")
                      expectation.fulfill()
                  })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5)
    }
}

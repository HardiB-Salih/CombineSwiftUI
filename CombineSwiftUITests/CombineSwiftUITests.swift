//
//  CombineSwiftUITests.swift
//  CombineSwiftUITests
//
//  Created by HardiB.Salih on 6/15/24.
//

import XCTest
import Combine

final class CombineSwiftUITests: XCTestCase {

    private var cancellables : Set<AnyCancellable> = []
    
    func testFetchMovies() throws {
        let httpClient = HTTPClient()
        let expectation = XCTestExpectation(description: "Receive movies")
        
        httpClient.fetchMovies(search: "Batman")
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    XCTFail("Failed to fetch movies: \(error)")
                }
            } receiveValue: { movies in
                XCTAssert(movies.count > 0)
            }.store(in: &cancellables)

    }

}

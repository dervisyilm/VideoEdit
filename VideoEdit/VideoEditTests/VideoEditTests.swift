//
//  VideoEditTests.swift
//  VideoEditTests
//
//  Created by Dervis YILMAZ on 15.01.2022.
//

import XCTest
@testable import VideoEdit


class VideoEditTests: XCTestCase {
    
    let viewModel = ViewModel()
    
    func testMovieApiResponse() throws{
    
    
        let expectation = self.expectation(description: "Movie Response Parse Expectation")
        
        do {
            
            viewModel.fetch()

            XCTAssertNotNil(viewModel.movies)
            expectation.fulfill()
            
        } catch  {
            XCTFail("Error unit test")
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        
        
    }

    func testExample() throws {
        
        guard let pathString = Bundle(for: type(of: self)).path(forResource: "movies", ofType: "json") else {
            fatalError("json not found")
        }

        guard let json = try? String(contentsOfFile: pathString, encoding: .utf8) else {
            fatalError("Unable to convert json to String")
        }

        let jsonData = json.data(using: .utf8)!
        let movie = try! JSONDecoder().decode([Movie].self, from: jsonData)
        
        XCTAssertEqual("Movies", movie[0].name)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

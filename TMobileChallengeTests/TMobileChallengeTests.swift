//
//  TMobileChallengeTests.swift
//  TMobileChallengeTests
//
//  Created by Rave Bizz on 3/20/21.
//

import XCTest
@testable import TMobileChallenge

class TMobileCodeChallengeTests: XCTestCase {

    var sut: Reddit?
    
    override func setUpWithError() throws {
        let testBundle = Bundle(for: type(of: self))
        if let path = testBundle.path(forResource: "mockData", ofType: "json") {
            if let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) {
                let decoder = JSONDecoder()
                let postResponse = try? decoder.decode(Reddit.self, from: jsonData)
                sut = postResponse
            }
        }
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func test_DecodePostModelFromMockData() {
        guard let sut = sut else { return }
        let postsArray = sut.data.children
        XCTAssertEqual(postsArray.count, 1, "Posts array should contain 1 entry")
        
    }

    
    func test_PostArrayContainsPostWithTitle() {
        guard let sut = sut else { return }
        let postTitle = sut.data.children[0].data.title
        XCTAssertEqual(postTitle, "StoreKit Testing Improvements in iOS 14")
    }
    
}

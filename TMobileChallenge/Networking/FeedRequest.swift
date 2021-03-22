//
//  FeedRequest.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/21/21.
//

import Foundation

class FeedRequest {
    
    enum FeedRequestError: Error {
        case noDataAvailable
        case cannotDecodeData
    }
    
    let sourceURL: URL
    
    init(pagination: Bool, afterLink: String = "") {
        let sourceString = pagination ? "http://www.reddit.com/.json?after=\(afterLink)" : "http://www.reddit.com/.json"
        guard let sourceURL = URL(string: sourceString) else { fatalError() }
        self.sourceURL = sourceURL
    }
    
    func getPosts(completion: @escaping (Result<[Post], FeedRequestError>) -> Void){
        PostVM.isFetchingData = true
        let dataTask = URLSession.shared.dataTask(with: sourceURL) { data, response, error in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let feedResponse = try decoder.decode(Reddit.self, from: jsonData)
                let posts = feedResponse.data.children
                PostVM.after = feedResponse.data.after
                completion(.success(posts))
            } catch {
                completion(.failure(.cannotDecodeData))
            }
            PostVM.isFetchingData = false
        }
        dataTask.resume()
    }
}

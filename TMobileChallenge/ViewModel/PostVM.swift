//
//  PostVM.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/20/21.
//

import UIKit

class PostVM {
    private(set) var post: Post
    
    let imageURL: String
    let title: String
    let numComments: Int
    let score: Int
    var ratio: CGFloat
    
    init(post: Post) {
        self.post = post
        title = post.data.title
        numComments = post.data.num_comments
        imageURL = post.data.thumbnail
        score = post.data.score
        ratio = 1.0
        
        if let height = post.data.thumbnail_height {
            if let width = post.data.thumbnail_width {
                ratio = CGFloat(height) / CGFloat(width)
            }
        }
    }
    static var isFetchingData = false
    
    static var after: String?
    
    static func fetchFeed(viewModel: inout [PostVM], pagination: Bool = false, afterlink: String = "") {
        var fetchedPostsVM = [PostVM]()
        let semaphore = DispatchSemaphore(value: 0)
        let feedRequest = FeedRequest(pagination: pagination, afterLink: afterlink)
        feedRequest.getPosts { result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let posts):
                fetchedPostsVM = posts.map({ return PostVM(post: $0)})
                semaphore.signal()
            }
        }
        _ = semaphore.wait(timeout: .distantFuture)
        viewModel.append(contentsOf: fetchedPostsVM)
    }
}

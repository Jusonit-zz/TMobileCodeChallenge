//
//  jsonStructure.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/20/21.
//

import Foundation

struct Reddit: Decodable {
    let data: Data
}

struct Data: Decodable {
    let children: [Post]
    let after: String?
}

struct Post: Decodable {
    let data: PostInfo
}

struct PostInfo: Decodable {
    let title: String
    let thumbnail: String
    let thumbnail_height: Int?
    let thumbnail_width: Int?
    let score: Int
    let num_comments: Int
}

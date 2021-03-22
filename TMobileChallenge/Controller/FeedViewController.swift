//
//  FeedViewController.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/21/21.
//

import UIKit

class FeedViewController: UITableViewController {
    
    var postViewModel = [PostVM]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PostTables.self, forCellReuseIdentifier: PostTables.identifier)
        PostVM.fetchFeed(viewModel: &postViewModel)
        self.tableView.estimatedRowHeight = 200
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}

/*
 http://www.reddit.com/.json
 http://www.reddit.com/.json?after= + afterLink
 
 - image
 - title
 - comment number
 - score.api
 
 */


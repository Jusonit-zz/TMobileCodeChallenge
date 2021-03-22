//
//  PostTables.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/21/21.
//

import UIKit

class PostTables: UITableViewCell {
    public static let identifier = "post"
    
    var postViewModel: PostVM! {
        didSet {
            aspectRatio = (postViewModel.ratio*100).rounded()/100
            title.text = postViewModel.title
            numComments.text = "\(postViewModel.numComments)"
            score.text = "\(postViewModel.score)"
            loadImage(urlString: postViewModel.imageURL)
            configureView()
            setupConstraints()
        }
    }
    
    private var title = UILabel()
    private var numComments = UILabel()
    private var score = UILabel()
    private var postImage = UIImageView()
    private var commentImage = UIImageView()
    private var scoreImage = UIImageView()
    
    private var aspectRatio: CGFloat = 1
    
    private func loadImage(urlString: String) {
        ImageSingle.shared.runImage(from: urlString) { image in
            self.postImage.image = image
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(title, postImage, score, numComments, commentImage, scoreImage)
        
        func configurePostTitle() {
            title.numberOfLines = 0
            title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            title.adjustsFontSizeToFitWidth = true
            title.textAlignment = .left
        }
        
        func configurePostImage() {
            postImage.clipsToBounds = true
            postImage.image = UIImage(named: "loading")
        }
        func configureCommentImage() {
            commentImage.image = UIImage(systemName: "bubble.left.fill")
        }
        func configureScoreImage() {
            scoreImage.image = UIImage(systemName: "hand.thumbsup.fill")
        }
        func configureComments() {
            numComments.numberOfLines = 0
            numComments.textAlignment = .left
            numComments.font = .boldSystemFont(ofSize: 10)
        }
        func configureScore() {
            score.numberOfLines = 0
            score.textAlignment = .left
            score.font = .boldSystemFont(ofSize: 10)
        }
        configurePostTitle()
        configurePostImage()
        configureCommentImage()
        configureScoreImage()
        configureComments()
        configureScore()
    }
    
    private func setupConstraints() {
        func setTitleConstraints() {
            title.leadingAnchor.constraint(to: leadingAnchor, with: Dimensions.padding)
            title.trailingAnchor.constraint(to: trailingAnchor, with: Dimensions.rightPadding)
            title.topAnchor.constraint(to: topAnchor, with: Dimensions.padding/2)
        }
        
        func setImageConstraints() {
            postImage.leadingAnchor.constraint(to: leadingAnchor)
            postImage.trailingAnchor.constraint(to: trailingAnchor)
            postImage.topAnchor.constraint(to: title.bottomAnchor, with: Dimensions.padding)
            postImage.heightAnchor.constraint(to: postImage.widthAnchor, multiplyBy: aspectRatio)
        }
        func setCommentImageConstraints() {
            commentImage.topAnchor.constraint(to: postImage.bottomAnchor, with: Dimensions.padding)
            commentImage.leadingAnchor.constraint(to: leadingAnchor, with: Dimensions.largerPadding*2)
        }
        
        func setScoreConstraints() {
            score.leadingAnchor.constraint(to: scoreImage.trailingAnchor)
            score.centerYAnchor.constraint(to: scoreImage.centerYAnchor)
            score.widthAnchor.constraint(to: widthAnchor, multiplyBy: Dimensions.fourthRatio)
        }
        
        func setNumCommentsConstraints() {
            numComments.leadingAnchor.constraint(to: commentImage.trailingAnchor)
            numComments.centerYAnchor.constraint(to: commentImage.centerYAnchor)
            numComments.widthAnchor.constraint(to: widthAnchor, multiplyBy: Dimensions.fourthRatio)
        }
        func setScoreImageConstraints() {
            scoreImage.topAnchor.constraint(to: postImage.bottomAnchor, with: Dimensions.padding)
            scoreImage.leadingAnchor.constraint(to: numComments.trailingAnchor, with: Dimensions.largerPadding*2)
            scoreImage.bottomAnchor.constraint(to: bottomAnchor, with: -Dimensions.padding)
        }
        
        setTitleConstraints()
        setImageConstraints()
        setScoreConstraints()
        setScoreImageConstraints()
        setCommentImageConstraints()
        setNumCommentsConstraints()
    }
}

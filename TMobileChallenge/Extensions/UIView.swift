//
//  UIView.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/20/21.
//

import UIKit

extension UIView {
    
    func addSubview(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

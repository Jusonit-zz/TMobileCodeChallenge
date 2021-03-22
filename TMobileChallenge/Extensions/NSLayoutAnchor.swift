//
//  NSLayoutAnchor.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/20/21.
//

import UIKit

@objc extension NSLayoutAnchor {
    
    @discardableResult
    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
                    to anchor: NSLayoutAnchor,
                    with constant: CGFloat = 0.0,
                    prioritizeAs priority: UILayoutPriority = .required,
                    isActive: Bool = true) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch relation {
        case .equal:
            constraint = self.constraint(equalTo: anchor, constant: constant)
            
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualTo: anchor, constant: constant)
            
        default:
            constraint = self.constraint(equalTo: anchor, constant: constant)
        }
        
        constraint.priority = priority
        constraint.isActive = isActive
        return constraint
    }
}

//
//  NSLayoutDimensions.swift
//  TMobileChallenge
//
//  Created by Rave Bizz on 3/20/21.
//

import UIKit

extension NSLayoutDimension {
    @discardableResult //surpress 'result unused' warning'
    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
                    to anchor: NSLayoutDimension,
                    with constant: CGFloat = 0.0,
                    multiplyBy multiplier: CGFloat = 1.0,
                    isActive: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = isActive
        
        return constraint
    }
    
    @discardableResult
    func constraint(_ relation: NSLayoutConstraint.Relation = .equal,
                    to constant: CGFloat = 0.0,
                    isActive: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint = self.constraint(equalToConstant: constant)
        constraint.isActive = isActive
        return constraint
    }
}

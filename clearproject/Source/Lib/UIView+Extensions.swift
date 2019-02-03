//
//  UIView+Extensions.swift
//  clearproject
//
//  Created by Alexey Khomych on 1/30/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDictionary))
    }
}

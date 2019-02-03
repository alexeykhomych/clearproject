//
//  MenuCollectionViewCell.swift
//  clearproject
//
//  Created by Alexey Khomych on 2/3/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: BaseCollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .rgb(red: 91, green: 14, blue: 13)
        
        return imageView
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor =  isHighlighted ? .white : .rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor =  isSelected ? .white : .rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func configure() {
        super.configure()
        
        addSubview(imageView)
        addConstraintWithFormat(format: "H:[v0(28)]", views: imageView)
        addConstraintWithFormat(format: "V:[v0(28)]", views: imageView)
        
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}

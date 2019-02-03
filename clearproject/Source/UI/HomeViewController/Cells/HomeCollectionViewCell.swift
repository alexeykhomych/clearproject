//
//  HomeCollectionViewCell.swift
//  clearproject
//
//  Created by Alexey Khomych on 1/24/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: BaseCollectionViewCell, ReusableCellType {
    
    typealias Model = AnyObject
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        return view
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.image = UIImage(named: "taylor_swift_profile")
//        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "TaylorSwiftVEVO - 1,604,684,607 views - 2 years ago"
        textView.textContainerInset = UIEdgeInsetsMake(0, -2, 0, 0)
        textView.textColor = .lightGray
        
        return textView
    }()
    
    override func configure() {
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)

        addConstraintWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintWithFormat(format: "H:|-16-[v0(44)]|", views: userProfileImageView)
        addConstraintWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        addConstraintWithFormat(format: "H:|[v0]|", views: separatorView)
        
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: thumbnailImageView,
                                         attribute: .bottom,
                                         multiplier: 1,
                                         constant: 8))
        
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: userProfileImageView,
                                         attribute: .right,
                                         multiplier: 1,
                                         constant: 8))
        
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: thumbnailImageView,
                                         attribute: .right,
                                         multiplier: 1,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: titleLabel,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .height,
                                         multiplier: 0,
                                         constant: 20))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,
                                         attribute: .top,
                                         relatedBy: .equal,
                                         toItem: titleLabel,
                                         attribute: .bottom,
                                         multiplier: 1,
                                         constant: 4))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,
                                         attribute: .left,
                                         relatedBy: .equal,
                                         toItem: userProfileImageView,
                                         attribute: .right,
                                         multiplier: 1,
                                         constant: 8))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,
                                         attribute: .right,
                                         relatedBy: .equal,
                                         toItem: thumbnailImageView,
                                         attribute: .right,
                                         multiplier: 1,
                                         constant: 0))
        
        addConstraint(NSLayoutConstraint(item: subtitleTextView,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: self,
                                         attribute: .height,
                                         multiplier: 0,
                                         constant: 30))
    }

    func fill(with model: Model) {
        
    }
}

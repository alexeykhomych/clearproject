//
//  BaseCollectionViewCell.swift
//  clearproject
//
//  Created by Alexey Khomych on 2/3/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
}

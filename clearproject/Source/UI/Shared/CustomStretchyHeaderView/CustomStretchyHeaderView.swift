//
//  CustomStretchyHeaderView.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/11/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

extension UIView {
    /** Loads instance from nib with the same name. */
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CustomStretchyHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}

class CustomStretchyHeaderView: GSKStretchyHeaderView {
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var navigationBar: UIView?
    @IBOutlet var backButton: UIButton?
    @IBOutlet var editButton: UIButton?
    @IBOutlet var settingsButton: UIButton?
    
    func fill(_ model: User) {
        self.imageView?.image = UIImage(named: model.image)
    }
}

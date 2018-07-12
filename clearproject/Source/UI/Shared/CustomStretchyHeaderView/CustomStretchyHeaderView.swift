//
//  CustomStretchyHeaderView.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/11/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

enum UIColorScheme {
    case white
    case blue
}

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
    @IBOutlet var avatarPreview: UIImageView?
    @IBOutlet var usernameLabel: UILabel?
    @IBOutlet var userInfoView: UIView?
    
//    override func didChangeStretchFactor(_ stretchFactor: CGFloat) {
//        super.didChangeStretchFactor(stretchFactor)
//        print(stretchFactor)
//    }
    
    func fill(_ model: User) {
        self.imageView?.image = UIImage(named: model.image)
    }
    
    func changeColorScheme(_ scheme: UIColorScheme) {
//        switch scheme {
//        case .white:
//            self.backButton?.backgroundColor = UIColor.white
//            self.editButton?.backgroundColor = UIColor.white
//            self.settingsButton?.backgroundColor = UIColor.white
//        case .blue:
//            self.backButton?.backgroundColor = UIColor.blue
//            self.editButton?.backgroundColor = UIColor.blue
//            self.settingsButton?.backgroundColor = UIColor.blue
//        }
    }
}

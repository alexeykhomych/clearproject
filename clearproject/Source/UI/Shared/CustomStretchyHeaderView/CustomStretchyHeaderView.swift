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
    static func fromNib<T : UIView, U : UIViewController>(owner: U?) -> T? {
        let name = String(describing: self)
        guard let view = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?.first as? T
            else {
                return nil
        }
        
        return view
    }
}

class CustomStretchyHeaderView: GSKStretchyHeaderView {
    @IBOutlet var imageView: UIImageView?
    
    func fill(_ model: User) {
        self.imageView?.image = UIImage(named: model.image)
    }
}

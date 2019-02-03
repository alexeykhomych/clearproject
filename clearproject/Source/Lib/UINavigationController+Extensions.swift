//
//  UINavigationController+Extensions.swift
//  clearproject
//
//  Created by Alexey Khomych on 2/3/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

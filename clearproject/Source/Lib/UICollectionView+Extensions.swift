//
//  UICollectionView+Extensions.swift
//  compot2
//
//  Created by Alexey Khomych on 4/12/18.
//  Copyright © 2018 About the code. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCell<T: UICollectionViewCell>(cellClass: T.Type) {
        let identifier = String(describing: cellClass.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}

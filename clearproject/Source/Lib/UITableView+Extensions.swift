//
//  UITableView+Extensions.swift
//  compot2
//
//  Created by Alexey Khomych on 2/26/18.
//  Copyright © 2018 About the code. All rights reserved.
//

import UIKit

extension UITableView {
    func indexPathForCellContains(view sender: UIView) -> IndexPath? {
        let loc = convert(CGPoint(x: sender.frame.midX, y: sender.frame.midY),
                          from: sender.superview)
        let indexPath = indexPathForRow(at: loc)
        return indexPath
    }
    
    func dequeueReusableCellWith<T: UITableViewCell>(cellClass: T.Type) -> T {
        let identifier = String(describing: cellClass.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("Сell \(identifier) not found")
        }
        
        return cell
    }
    
    func registerCell<T: UITableViewCell>(cellClass: T.Type) {
        let identifier = String(describing: cellClass.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}

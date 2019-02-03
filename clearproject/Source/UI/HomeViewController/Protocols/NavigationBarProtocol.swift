//
//  NavigationBarProtocol.swift
//  clearproject
//
//  Created by Alexey Khomych on 2/3/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

protocol NavigationBarProtocol {
    var menuBar: MenuBar { get set }
    func setupMenuBar()
}

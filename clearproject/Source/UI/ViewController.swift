//
//  ViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .lightGray
        self.createBlueView()
        self.createGreenView()
    }

    func createBlueView() {
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        self.view.addSubview(blueView)
        
        blueView.translatesAutoresizingMaskIntoConstraints = false
        blueView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        blueView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        blueView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5).isActive = true
        blueView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.33).isActive = true
    }
    
    func createGreenView() {
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        self.view.addSubview(greenView)
        
        greenView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
            make.width.equalToSuperview().dividedBy(2)
            make.height.equalToSuperview().dividedBy(3)
        }
    }
}

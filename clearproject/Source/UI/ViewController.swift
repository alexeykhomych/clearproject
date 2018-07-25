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
        self.example()
        self.customNavBar()
        self.viewsInView()
    }
    
    func example() {
        let superview = self.view
        let button = UIButton()
        
        button.layer.cornerRadius = 33
        button.setTitle("+", for: .normal)
        button.backgroundColor = .black
        
        superview?.addSubview(button)
        
        button.snp.makeConstraints { (make) in
            make.width.equalTo(66)
            make.height.equalTo(66)
            make.bottom.equalToSuperview().offset(-20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    func customNavBar() {
        let superView = self.view
        let navBar = UIView()
        
        navBar.backgroundColor = .green
        superView?.addSubview(navBar)
        
        navBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(80)
        }
        
        let titleLabel = UILabel()
        titleLabel.text = "Funny snap"
        titleLabel.textColor = .black
        titleLabel.sizeToFit()
        
        navBar.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func viewsInView() {
        let container = UIView()
        container.backgroundColor = .yellow
        container.snp.makeConstraints { (make) in
            
        }
        
        let firstView = UIView()
        firstView.backgroundColor = .black
        firstView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.height.equalTo(40)
            make.width.equalTo(60)
            make.leading.equalToSuperview().offset(30)
        }
        
        let secondView = UIView()
        secondView.backgroundColor = .gray
        secondView.snp.makeConstraints { (make) in
            make.width.equalTo(firstView.snp.width)
            make.height.equalTo(firstView.snp.height)
        }
        
        let thirdView = UIView()
        thirdView.backgroundColor = .gray
        thirdView.snp.makeConstraints { (make) in
            
        }
        
        container.addSubview(firstView)
        container.addSubview(secondView)
        container.addSubview(thirdView)
        
        self.view.addSubview(container)
    }
}

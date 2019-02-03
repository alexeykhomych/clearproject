
//
//  HomeViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 1/24/19.
//  Copyright © 2019 Alexey Khomych. All rights reserved.
//

import UIKit

extension HomeViewController: NavigationBarProtocol {
    func setupMenuBar() {
        rootView.addSubview(menuBar)
        rootView.addConstraintWithFormat(format: "H:|[v0]|", views: menuBar)
        rootView.addConstraintWithFormat(format: "V:|[v0(50)]|", views: menuBar)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeCollectionViewCell

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (rootView.frame.width - 16 - 16) * 9 / 16
        
        return CGSize(width: rootView.frame.width, height: height + 16 + 68)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

class HomeViewController: UIViewController {
    
    //MARK: Accessors
    
    var menuBar: MenuBar = {
        let menu = MenuBar()
        
        return menu
    }()
    
    private var rootView: HomeView {
        return view as! HomeView
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: View life-cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: rootView.frame.width, height: rootView.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        configureCollectionView()
        setupMenuBar()
    }
    
    //MARK: Private methods
    
    private func configureCollectionView() {
        guard let collectionView = rootView.collectionView else { return }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        collectionView.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }
}

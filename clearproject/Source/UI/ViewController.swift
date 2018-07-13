//
//  ViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

let maximumContentHeight: CGFloat = 200.0
let minimumContentHeight: CGFloat = 150.0

extension ViewController: GSKStretchyHeaderViewStretchDelegate {
    func stretchyHeaderView(_ headerView: GSKStretchyHeaderView, didChangeStretchFactor stretchFactor: CGFloat) {
        guard let stretchyHeader = self.rootView?.stretchyHeader else { return }
        
        var alpha: CGFloat
        var backgroundColor: UIColor
        var isUserInfoHidden: Bool
        
        if stretchFactor <= 0.5 {
            alpha = 0
            backgroundColor = UIColor.white
            isUserInfoHidden = false
        } else {
            alpha = 1
            backgroundColor = UIColor.clear
            isUserInfoHidden = true
        }
        
        UIView.animate(withDuration: 0.1) {
            stretchyHeader.imageView?.alpha = alpha
            stretchyHeader.navigationBar?.backgroundColor = backgroundColor
            stretchyHeader.userInfoView?.isHidden = isUserInfoHidden
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: "none")
        }
        
        cell.fill(self.models![indexPath.row])
        
        return cell
    }
}

class ViewController: UIViewController {
    
    var models: [Article]?
    
    var rootView: View? {
        return self.viewIfLoaded as? View
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tableView = self.rootView?.tableView else {
            fatalError()
        }
        
        self.prepareModels()
        self.prepareTableView(tableView)
        self.prepapreFlexibleHeader(rootView: self.view, tableView: tableView)
    }
    
    private func prepareModels() {
        var models = [Article]()
        for _ in 0...15 {
            models.append(Article(title: "first", description: "item"))
        }
        
        self.models = models
    }
    
    private func prepareTableView(_ tableView: UITableView) {
        let identifier = String(describing: TableViewCell.self)
        
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = maximumContentHeight
    }
    
    private func prepapreFlexibleHeader(rootView: UIView, tableView: UITableView) {
        let maxHeight: CGFloat = maximumContentHeight
        
        let headerSize = CGSize(width: tableView.frame.size.width,
                                height: maxHeight) // 200 will be the default height
        let headerView = CustomStretchyHeaderView.fromNib(owner: self) as! CustomStretchyHeaderView
        
        headerView.stretchDelegate = self
        
        headerView.frame = CGRect(x: 0, y: 0, width: headerSize.width, height: headerSize.height)
        headerView.minimumContentHeight = 100
        headerView.maximumContentHeight = maxHeight
        headerView.contentExpands = false // useful if you want to display the refreshControl below the header view

        // You can specify if the content expands when the table view bounces, and if it shrinks if contentView.height < maximumContentHeight. This is specially convenient if you use auto layout inside the stretchy header view
        headerView.contentShrinks = false
//        headerView.fill(User(name: "user", bio: "Krieger was born in São Paulo, Brazil, and moved to California in 2004 to attend Stanford University. At Stanford, where he studied symbolic systems, he met Kevin Systrom.", image: "avatar"))
        
        headerView.imageView?.image = UIImage(named: "avatar")
        
        self.rootView?.stretchyHeader = headerView
        tableView.addSubview(headerView)
    }
}

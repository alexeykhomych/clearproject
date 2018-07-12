//
//  ViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

struct User {
    var name: String
    var bio: String
    var image: String
}

struct Model {
    var title: String
    var description: String
}

extension ViewController: GSKStretchyHeaderViewStretchDelegate {
    func stretchyHeaderView(_ headerView: GSKStretchyHeaderView, didChangeStretchFactor stretchFactor: CGFloat) {
        if stretchFactor <= 0.5 {
            UIView.animate(withDuration: 0.1) {
                self.stretchyHeader.imageView?.alpha = 0
                self.stretchyHeader.navigationBar?.backgroundColor = UIColor.white
            }
            self.stretchyHeader.userInfoView?.isHidden = false
//            self.stretchyHeader.changeColorScheme(.blue)
        } else {
            UIView.animate(withDuration: 0.1) {
                self.stretchyHeader.imageView?.alpha = 1
                self.stretchyHeader.navigationBar?.backgroundColor = UIColor.clear
            }
            
            self.stretchyHeader.userInfoView?.isHidden = true
//            self.stretchyHeader.changeColorScheme(.white)
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
    
    @IBOutlet var tableView: UITableView?
//    @IBOutlet var stretchyHeader: CustomStretchyHeaderView!
    
    var models: [Model]?
    
    var stretchyHeader: CustomStretchyHeaderView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tableView = self.tableView else {
            fatalError()
        }
        
        self.prepareModels()
        self.prepareTableView(tableView)
        self.prepapreFlexibleHeader(rootView: self.view, tableView: tableView)
    }
    
    private func prepareModels() {
        var models = [Model]()
        for _ in 0...2 {
            models.append(Model(title: "first", description: "item"))
        }
        
        self.models = models
    }
    
    private func prepareTableView(_ tableView: UITableView) {
        let identifier = String(describing: TableViewCell.self)
        
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
    }
    
    private func prepapreFlexibleHeader(rootView: UIView, tableView: UITableView) {
        let maxHeight: CGFloat = 200
        
        let headerSize = CGSize(width: tableView.frame.size.width,
                                height: maxHeight) // 200 will be the default height
        let headerView = UIView.instanceFromNib() as! CustomStretchyHeaderView
        
        headerView.stretchDelegate = self
        
        headerView.frame = CGRect(x: 0, y: 0, width: headerSize.width, height: headerSize.height)
        headerView.minimumContentHeight = 100
        headerView.maximumContentHeight = maxHeight
        headerView.contentExpands = false // useful if you want to display the refreshControl below the header view

        // You can specify if the content expands when the table view bounces, and if it shrinks if contentView.height < maximumContentHeight. This is specially convenient if you use auto layout inside the stretchy header view
        headerView.contentShrinks = false
//        headerView.fill(User(name: "user", bio: "Krieger was born in São Paulo, Brazil, and moved to California in 2004 to attend Stanford University. At Stanford, where he studied symbolic systems, he met Kevin Systrom.", image: "avatar"))
        
        headerView.imageView?.image = UIImage(named: "avatar")
        
        self.stretchyHeader = headerView
        tableView.addSubview(headerView)
    }
}

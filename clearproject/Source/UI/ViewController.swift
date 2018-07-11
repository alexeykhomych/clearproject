//
//  ViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import GSKStretchyHeaderView

struct Model {
    var title: String
    var description: String
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
    @IBOutlet var scrollView: UIScrollView?
    
    var models: [Model]?
    
    var stretchyHeader: GSKStretchyHeaderView!
    
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
        for _ in 0...15 {
            models.append(Model(title: "first", description: "item"))
        }
        
        self.models = models
    }
    
    private func prepareTableView(_ tableView: UITableView) {
        let identifier = String(describing: TableViewCell.self)
        
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func prepapreFlexibleHeader(rootView: UIView, tableView: UITableView) {
        let headerSize = CGSize(width: tableView.frame.size.width,
                                height: 200) // 200 will be the default height
        let headerView = GSKStretchyHeaderView(frame: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: headerSize.width,
                                                                  height: headerSize.height))
        headerView.backgroundColor = UIColor.blue
        headerView.minimumContentHeight = 50
        headerView.maximumContentHeight = 150
        headerView.contentExpands = false // useful if you want to display the refreshControl below the header view

        // You can specify if the content expands when the table view bounces, and if it shrinks if contentView.height < maximumContentHeight. This is specially convenient if you use auto layout inside the stretchy header view
        headerView.contentShrinks = false
        
        self.stretchyHeader = headerView
        tableView.addSubview(self.stretchyHeader)
    }
}

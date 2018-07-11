//
//  ViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialFlexibleHeader

struct Model {
    var title: String
    var description: String
}

extension ViewController: MDCFlexibleHeaderViewLayoutDelegate {
    func flexibleHeaderViewController(_: MDCFlexibleHeaderViewController,
                                      flexibleHeaderViewFrameDidChange flexibleHeaderView: MDCFlexibleHeaderView) {
        // Called whenever the frame changes.
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
    @IBOutlet var scrollView: UIScrollView?
    
    var models: [Model]?
    
    let headerViewController = MDCFlexibleHeaderViewController()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        addChildViewController(headerViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addChildViewController(headerViewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let tableView = self.tableView else {
            fatalError()
        }
        
        self.prepareModels()
        self.prepareTableView(tableView)
        self.prepapreFlexibleHeader(self.headerViewController,
                                    rootView: self.view,
                                    tableView: tableView)
    }
    
    private func prepareModels() {
        self.models = [Model(title: "first", description: "item"),
                       Model(title: "second", description: "item"),
                       Model(title: "third", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item"),
                       Model(title: "fourth", description: "item")]
    }
    
    private func prepareTableView(_ tableView: UITableView) {
        let identifier = String(describing: TableViewCell.self)
        
        tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
        tableView.delegate = self.headerViewController
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func prepapreFlexibleHeader(_ viewController: MDCFlexibleHeaderViewController,
                                        rootView: UIView,
                                        tableView: UITableView) {
        viewController.view.frame = rootView.bounds
        viewController.headerView.trackingScrollView = self.scrollView
        viewController.headerView.shiftBehavior = .enabledWithStatusBar
        
        rootView.addSubview(headerViewController.view)
        viewController.didMove(toParentViewController: self)
    }
}

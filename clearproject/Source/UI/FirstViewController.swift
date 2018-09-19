//
//  FirstViewController.swift
//  clearproject
//
//  Created by Alexey Khomych on 9/18/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let identifier = String(describing: TableViewCell.self)
        self.tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        guard let customCell = cell as? TableViewCell else {
            return cell
        }
        
        customCell.sometextLabel.text = "index \(indexPath.row)"
        
        return cell
    }
}

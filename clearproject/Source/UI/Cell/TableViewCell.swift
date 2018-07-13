//
//  TableViewCell.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit

let tableViewCellIdentifier = "TableViewCell"

class TableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    
    override var reuseIdentifier: String? {
        return tableViewCellIdentifier
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fill(_ model: Article) {
        self.titleLabel?.text = model.title
        self.descriptionLabel?.text = model.description
    }
}

//
//  TableViewCell.swift
//  clearproject
//
//  Created by Alexey Khomych on 7/10/18.
//  Copyright © 2018 Alexey Khomych. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    
    override var reuseIdentifier: String? {
        return "TableViewCell"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fill(_ model: Model) {
        self.titleLabel?.text = model.title
        self.descriptionLabel?.text = model.description
    }
}

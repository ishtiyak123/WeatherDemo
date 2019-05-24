//
//  headerViewTableViewCell.swift
//  CustomerApp
//
//  Created by Bhushan on 14/11/18.
//  Copyright © 2018 webskitters. All rights reserved.
//

import UIKit

class headerViewTableViewCell: UITableViewCell {
    
    @IBOutlet var lblTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

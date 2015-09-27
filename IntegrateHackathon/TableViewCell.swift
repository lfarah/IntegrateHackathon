//
//  TableViewCell.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/27/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

  @IBOutlet weak var name: UILabel!

  @IBOutlet weak var descr: UITextView!
  
  
  @IBOutlet weak var img: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  TableViewCell2.swift
//  IntegrateHackathon
//
//  Created by Lucas Farah on 9/27/15.
//  Copyright © 2015 Lucas Farah. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {

  @IBOutlet weak var lbl: UILabel!
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

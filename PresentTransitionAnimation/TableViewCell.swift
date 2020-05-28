//
//  TableViewCell.swift
//  PresentTransitionAnimation
//
//  Created by Ponkumar's Mac on 27/05/20.
//  Copyright © 2020 Ponkumar's Mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

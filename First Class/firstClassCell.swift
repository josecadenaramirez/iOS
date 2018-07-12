//
//  firstClassCell.swift
//  First Class
//
//  Created by José Cadena on 12/07/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class firstClassCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

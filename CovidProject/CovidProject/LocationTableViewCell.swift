//
//  LocationTableViewCell.swift
//  CovidProject
//
//  Created by Donnell Debnam on 4/13/21.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

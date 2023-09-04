//
//  EmailsTableViewCell.swift
//  ForwardSheet
//
//  Created by Ideas2IT on 07/08/23.
//

import UIKit

class EmailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var radioBtn: UIButton!

    weak var headCell : UITableViewCell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        iconImage.tintColor = UIColor(hex: "#8877F2")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

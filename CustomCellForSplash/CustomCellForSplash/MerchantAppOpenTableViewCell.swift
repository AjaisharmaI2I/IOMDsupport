//
//  MerchantAppOpenTableViewCell.swift
//  CustomCellForSplash
//
//  Created by Ideas2IT on 21/07/23.
//

import UIKit

class MerchantAppOpenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var setupStepLbl: UILabel!
    @IBOutlet weak var sideImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

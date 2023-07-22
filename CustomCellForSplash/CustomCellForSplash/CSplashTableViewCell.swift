//
//  CSplashTableViewCell.swift
//  CustomCellForSplash
//
//  Created by Ideas2IT on 21/07/23.
//

import UIKit

class CSplashTableViewCell: UITableViewCell {
    
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var checkBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backgroundColor = UIColor(hex: "#F2F2F6")
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(hex: "#E8E8E8")?.cgColor
        checkBtn.tintColor = UIColor(hex: "#E8E8E8")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

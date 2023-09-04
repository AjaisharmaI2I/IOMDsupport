//
//  MyTableViewCell.swift
//  ForwardSheet
//
//  Created by Ideas2IT on 10/08/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var selectedOptLbl: UILabel!
    @IBOutlet weak var dropDownBtn: UIButton!
    @IBOutlet weak var dropDownBtnCenterContraint: NSLayoutConstraint!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var radioBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectedOptLbl.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

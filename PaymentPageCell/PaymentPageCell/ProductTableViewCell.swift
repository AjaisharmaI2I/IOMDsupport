//
//  ProductTableViewCell.swift
//  PaymentPageCell
//
//  Created by Ideas2IT on 07/07/23.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var price1: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var title3: UILabel!
    @IBOutlet weak var price3: UILabel!
    @IBOutlet weak var dropDown: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

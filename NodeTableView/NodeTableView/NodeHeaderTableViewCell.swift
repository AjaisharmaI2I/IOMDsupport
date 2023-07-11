//
//  NodeHeaderTableViewCell.swift
//  NodeTableView
//
//  Created by Ideas2IT on 04/07/23.
//

import UIKit

class NodeHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var shareIcon: UIImageView!
    @IBOutlet weak var favouriteIcon: UIImageView!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var purchasedBeforeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

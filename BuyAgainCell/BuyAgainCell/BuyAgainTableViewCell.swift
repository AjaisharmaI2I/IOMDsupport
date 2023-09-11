//
//  BuyAgainTableViewCell.swift
//  BuyAgainCell
//
//  Created by Ideas2IT on 08/09/23.
//

import UIKit

class BuyAgainTableViewCell: UITableViewCell {

    @IBOutlet weak var stackContainer: UIStackView!
    @IBOutlet weak var buyAgainBtn: UIButton!
    @IBOutlet weak var offerBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stackContainer.layer.cornerRadius = stackContainer.frame.height / 2
        stackContainer.layer.masksToBounds = true
        offerBtn.isHidden = true
//        let point : CGFloat = 10
//        offerBtn.imageEdgeInsets = UIEdgeInsets(top: point, left: point, bottom: point, right: point)
        buyAgainBtn.layer.cornerRadius = buyAgainBtn.frame.height / 2
        buyAgainBtn.layer.shadowColor = UIColor.black.cgColor
        buyAgainBtn.layer.shadowRadius = 2
        buyAgainBtn.layer.shadowOpacity = 0.5
        buyAgainBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
        buyAgainBtn.backgroundColor = .systemTeal
        offerBtn.backgroundColor = .secondarySystemBackground
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  NodeTableViewCell.swift
//  NodeTableView
//
//  Created by Ideas2IT on 03/07/23.
//

import UIKit

class NodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgView : UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var detailsLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

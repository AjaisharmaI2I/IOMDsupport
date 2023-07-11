//
//  OfferCollectionViewCell.swift
//  NodeTableView
//
//  Created by Ideas2IT on 09/07/23.
//

import UIKit

class OfferCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var offerExpiryLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var addBtn: UIButton!

    override func awakeFromNib() {
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
        layer.masksToBounds = false
        
        containerView.layer.cornerRadius = 10
        addBtn.layer.cornerRadius = 10
        addBtn.backgroundColor = .white
        let image = UIImage(systemName: "plus",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 10,
                                                                           weight: .bold))
        addBtn.setImage(image, for: .normal)
        addBtn.layer.shadowColor = UIColor.black.cgColor
        addBtn.layer.shadowOffset = CGSize(width: 0, height: 3)
        addBtn.layer.shadowOpacity = 0.4
        addBtn.layer.shadowRadius = 5
        addBtn.layer.masksToBounds = false
    }
}

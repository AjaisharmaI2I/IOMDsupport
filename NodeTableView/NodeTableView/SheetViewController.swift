//
//  SheetViewController.swift
//  NodeTableView
//
//  Created by Ideas2IT on 04/07/23.
//

import UIKit

class SheetViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var isEnabledBtn: UIButton!
    @IBOutlet weak var infoLbl1: UILabel!
    @IBOutlet weak var infoLbl2: UILabel!
    @IBOutlet weak var saveView: UIView!
    @IBOutlet weak var saveLbl: UILabel!
    @IBOutlet weak var autofillView: UIView!
    @IBOutlet weak var autofillLbl: UILabel!
    @IBOutlet weak var protectView: UIView!
    @IBOutlet weak var protectLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerTitleLbl: UILabel!
    @IBOutlet weak var containerContentLbl: UILabel!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nodemyLbl: UILabel!
    @IBOutlet weak var createBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        saveView.layer.cornerRadius = 10
        autofillView.layer.cornerRadius = 10
        protectView.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 10
        textFieldView.layer.cornerRadius = 8
        emailTF.layer.cornerRadius = 10
        imageView.layer.cornerRadius = 10
        
        isEnabledBtn.setTitle("Enable To Continue", for: .normal)
        if let image = UIImage(systemName: "checkmark.circle.fill") {
            let config = UIImage.SymbolConfiguration(pointSize: 55)
            let updatedImage = image.withConfiguration(config)
            
            var newConfig = isEnabledBtn.configuration ?? UIButton.Configuration.plain()
            newConfig.image = updatedImage
            newConfig.title = "Enable To Continue"
            newConfig.imagePlacement = .top
            isEnabledBtn.configuration = newConfig
        }
    }
}

//
//  SheetViewController.swift
//  UpdatedSheetUI
//
//  Created by Ideas2IT on 06/07/23.
//

import UIKit

enum Page: String, CaseIterable {
    case enableExtension = "Enable now"
    case enabledExtension = "Next"
    case createEmail = "Create"
    case emailCreated = "View My Information"
}

class SheetViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    
    // View for a Other pages
    @IBOutlet weak var containView1: UIView!
    @IBOutlet weak var autofillView: UIView! // color - #2C2B2F
    @IBOutlet weak var autofillLbl: UILabel!
    @IBOutlet weak var saveView: UIView!  // color - #45444E
    @IBOutlet weak var saveLbl: UILabel!
    @IBOutlet weak var privateView: UIView! // color - #2C2B2F
    @IBOutlet weak var privateLbl: UILabel!
    
    // View for a Email page
    @IBOutlet weak var containerView2: UIView!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var nodemyLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    @IBOutlet weak var enableNowBtn: UIButton! // color - #8877F2
    
    
    var orangColor = UIColor()
    var purpleColor = UIColor()
    var greenColor = UIColor()
    var topViewColor = UIColor()
    var middleViewColor = UIColor()
    var emailTFColor = UIColor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topColor = UIColor(hex: "#2C2B2F") {
            topViewColor = topColor
        }
        
        if let midColor = UIColor(hex: "#45444E") {
            middleViewColor = midColor
        }
        
        
        if let orange = UIColor(hex: "#ECAC4D") {
            orangColor = orange
        }
        
        if let purple = UIColor(hex: "#8877F2") {
            purpleColor = purple
        }
        
        if let green = UIColor(hex: "#45D4A2") {
            greenColor = green
        }
        
        if let emailColor = UIColor(hex: "#DFDCF3") {
            emailTFColor = emailColor
        }
        
        let cornerRadius: CGFloat = 8.0
        
        containView1.layer.cornerRadius = cornerRadius
        containView1.layer.masksToBounds = true
        
        autofillView.backgroundColor = topViewColor
        saveView.backgroundColor = middleViewColor
        privateView.backgroundColor = topViewColor
        
        textFieldView.layer.cornerRadius = cornerRadius
        emailTF.layer.cornerRadius = cornerRadius
        emailTF.backgroundColor = emailTFColor
        
        enableNowBtn.backgroundColor = UIColor.init(hex: "#8877F2")
        enableNowBtn.layer.cornerRadius = enableNowBtn.frame.height / 2
        enableNowBtn.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        // Font customized texts
        let boldPartString = NSMutableAttributedString(string: "Enable the Safari Browser Extension ",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
        let fontChangedString = NSAttributedString(string: "so you can", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
        boldPartString.append(fontChangedString)
        subTitleLbl.attributedText = boldPartString
        
        // Coloring texts
        let myColorString = NSMutableAttributedString(string: "Autofill this information anywhere")
        myColorString.addAttribute(NSAttributedString.Key.foregroundColor, value: orangColor, range: NSRange(location: 26, length: 8))
        autofillLbl.attributedText = myColorString
        
        let myColorString1 = NSMutableAttributedString(string: "Save any transaction automatically")
        myColorString1.addAttribute(NSAttributedString.Key.foregroundColor, value: orangColor, range: NSRange(location: 21, length: 13))
        saveLbl.attributedText = myColorString1
        
        let myColorString2 = NSMutableAttributedString(string: "Keep my personal email private")
        myColorString2.addAttribute(NSAttributedString.Key.foregroundColor, value: orangColor, range: NSRange(location: 23, length: 7))
        privateLbl.attributedText = myColorString2
    }
    
    @objc func buttonPressed(_ button: UIButton) {
        switch button.titleLabel?.text {
        case Page.enableExtension.rawValue:
            titleLbl.isHidden = true
            
            let boldPartString = NSMutableAttributedString(string: "Freedom!",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
            let fontChangedString = NSAttributedString(string: " never type my information again", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
            boldPartString.append(fontChangedString)
            subTitleLbl.attributedText = boldPartString
            
            let myColorString = NSMutableAttributedString(string: "Autofill this information anywhere")
            myColorString.addAttribute(NSAttributedString.Key.foregroundColor, value: greenColor, range: NSRange(location: 26, length: 8))
            autofillLbl.attributedText = myColorString
            
            let myColorString1 = NSMutableAttributedString(string: "Save any transaction automatically")
            myColorString1.addAttribute(NSAttributedString.Key.foregroundColor, value: greenColor, range: NSRange(location: 21, length: 13))
            saveLbl.attributedText = myColorString1
            
            let myColorString2 = NSMutableAttributedString(string: "Choose my private email")
            myColorString2.addAttribute(NSAttributedString.Key.foregroundColor, value: orangColor, range: NSMakeRange(10, 7))
            privateLbl.attributedText = myColorString2
            enableNowBtn.setTitle(Page.enabledExtension.rawValue, for: .normal) //#ECAC4D
            enableNowBtn.backgroundColor = UIColor(hex: "#ECAC4D")
            break
        case Page.enabledExtension.rawValue:
            titleLbl.isHidden = false
            titleLbl.text = "STEP 2/2"
            
            let boldPartString = NSMutableAttributedString(string: "Choose your private email",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
            subTitleLbl.attributedText = boldPartString
            
            enableNowBtn.setTitle(Page.createEmail.rawValue, for: .normal) //#8877F2
            enableNowBtn.backgroundColor = UIColor(hex: "#8877F2")
            containView1.isHidden = true
            containerView2.isHidden = false
            break
        case Page.createEmail.rawValue:
            titleLbl.isHidden = true
            let boldPartString = NSMutableAttributedString(string: "You have now a tokenized private email!",attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
            let fontChangedString = NSAttributedString(string: "  your online experiences will be the", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium)])
            boldPartString.append(fontChangedString)
            subTitleLbl.attributedText = boldPartString
            
            saveLbl.text = "Most convenient"
            saveLbl.textColor = greenColor
            autofillLbl.text = "Fastest"
            autofillLbl.textColor = greenColor
            privateLbl.text = "Safest"
            privateLbl.textColor = greenColor
            
            enableNowBtn.setTitle(Page.emailCreated.rawValue, for: .normal) // #45D4A2
            enableNowBtn.backgroundColor = greenColor
            containView1.isHidden = false
            containerView2.isHidden = true
            enableNowBtn.backgroundColor = greenColor
            break
        case Page.emailCreated.rawValue:
            print("View my infomation")
            break
        default:
            break
        }
    }
    
    
    func changeContentUI(for button: String) {
        
    }

}

//
//  BottomSheetViewController.swift
//  CustomerFlowBottomSheet
//
//  Created by Ideas2IT on 24/07/23.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    @IBOutlet weak var dragerView: UIView!
    @IBOutlet weak var setupStackContainer: UIStackView!
    @IBOutlet weak var setupStepContainer: UIView!
    @IBOutlet weak var setupStepLbl: UILabel!
    @IBOutlet weak var indicatorImageView: UIImageView!
    @IBOutlet weak var textFieldStackContainer: UIStackView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var textFieldOuterlayer: UIView!
    @IBOutlet weak var textFieldContainer: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var sufixLbl: UILabel!
    @IBOutlet weak var stackContainer: UIView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var bottomMessageLbl: UILabel!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var middleLbl: UILabel!
    @IBOutlet weak var bottomLbl: UILabel!
    
    var contentHeight: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dragerView.layer.cornerRadius = 3.5
        textFieldOuterlayer.layer.cornerRadius = 8
        textFieldContainer.layer.cornerRadius = 8
        stackContainer.layer.cornerRadius = 8
        stackContainer.layer.masksToBounds = true
        nextBtn.backgroundColor = .purple
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height / 2
        nextBtn.setTitle(ButtonTitle.howItWorks.rawValue, for: .normal)
        nextBtn.addTarget(self, action: #selector(nextBtnPressed(_:)), for: .touchUpInside)
        bottomMessageLbl.isHidden = true
        
//        contentHeight = getContentHeight()
    }
    
    @objc func nextBtnPressed(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case ButtonTitle.howItWorks.rawValue:
            setupStepLbl.text = "SETUP STEP 2/2"
            titleLbl.text = "Never type online again"
            nextBtn.setTitle(ButtonTitle.enableExtension.rawValue, for: .normal)
            bottomMessageLbl.isHidden = false
            textFieldOuterlayer.isHidden = true
            bottomMessageLbl.text = "This will take you to Safari and show you steps to do it"
            topLbl.text = "Swipe to sign in anywhere."
            middleLbl.text = "Save multiple addresses, passwords,\ncards & more."
            bottomLbl.text = "Autofill everything you save instantly."
            if let sheet = self.sheetPresentationController {
                sheet.detents = [.custom(resolver: { context in
                    return context.maximumDetentValue * 0.6
                })]
            }
            break
        case ButtonTitle.enableExtension.rawValue:
            nextBtn.setTitle(ButtonTitle.detecting.rawValue, for: .normal)
            setupStepContainer.isHidden = true
            titleLbl.text = "Enable the Node Safari\nbrowser extension"
            if let sheet = self.sheetPresentationController {
                sheet.detents = [.custom(resolver: { context in
                    return context.maximumDetentValue * 0.5
                })]
            }
            break
        case ButtonTitle.detecting.rawValue:
            nextBtn.setTitle(ButtonTitle.extensionEnabled.rawValue, for: .normal)
            break
        case ButtonTitle.extensionEnabled.rawValue:
            nextBtn.setTitle(ButtonTitle.toDashboard.rawValue, for: .normal)
            break
        case ButtonTitle.toDashboard.rawValue:
            // Dashboard Navigation
            print("Taking you to Dashboard")
            break
        default:
            break
        }
    }
    
//    func getContentHeight() -> Int {
//        return dragerView.frame.height + setupStackContainer.frame.height + textFieldStackContainer.frame.height + stackContainer.frame.height + nextBtn.frame.height + bottomMessageLbl.frame.height
//    }
}

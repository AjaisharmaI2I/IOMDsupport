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
    @IBOutlet weak var topLblContainer: UIView!
    @IBOutlet weak var topLbl: UILabel!
    @IBOutlet weak var middleLblContainer: UIView!
    @IBOutlet weak var middleLbl: UILabel!
    @IBOutlet weak var bottomLblContainer: UIView!
    @IBOutlet weak var bottomLbl: UILabel!
    
    var greenColor = UIColor()
    var purpleColor = UIColor()
    var darkGrayColor = UIColor()
    var lightGrayColor = UIColor()
    var inputBorderDarkGrayColor = UIColor()
    var inputContainerGrayColor = UIColor()
    
    var contentHeight: Int = 0
    var buttonTitles = ButtonTitle.allCases
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let green = UIColor(hex: "#209579") {
            greenColor = green
        }
        
        if let purple = UIColor(hex: "#8877F2") {
            purpleColor = purple
        }
        
        if let darkGray = UIColor(hex: "#2C2B2F") {
            darkGrayColor = darkGray
        }
        
        if let borderDarkGray = UIColor(hex: "#56545B") {
            inputBorderDarkGrayColor = borderDarkGray
        }
        
        if let lightGray = UIColor(hex: "#817F8A") {
            lightGrayColor = lightGray
        }
        
        if let inputContainerGray = UIColor(hex: "#E3E2ED") {
            inputContainerGrayColor = inputContainerGray
        }
        
        // Coloring
        setupStepLbl.textColor = purpleColor
        textFieldOuterlayer.backgroundColor = inputBorderDarkGrayColor
        textFieldContainer.backgroundColor = inputContainerGrayColor
        topLblContainer.backgroundColor = darkGrayColor
        middleLblContainer.backgroundColor = darkGrayColor
        bottomLblContainer.backgroundColor = darkGrayColor
        nextBtn.backgroundColor = purpleColor
        nextBtn.tintColor = .white
        
        
        // Corner Radius
        dragerView.layer.cornerRadius = 3.5
        textFieldOuterlayer.layer.cornerRadius = 8
        textFieldContainer.layer.cornerRadius = 8
        stackContainer.layer.cornerRadius = 8
        stackContainer.layer.masksToBounds = true
        nextBtn.layer.cornerRadius = nextBtn.frame.size.height / 2
        nextBtn.setTitle(ButtonTitle.howItWorks.rawValue, for: .normal)
        nextBtn.addTarget(self, action: #selector(nextBtnPressed(_:)), for: .touchUpInside)
        bottomMessageLbl.isHidden = true
    }
    
    @objc func nextBtnPressed(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case ButtonTitle.howItWorks.rawValue:
            setupStepLbl.text = "SETUP STEP 2/2"
            titleLbl.text = "Never type online again"
            indicatorImageView.image = UIImage(named: "PuzzlePurple")
            nextBtn.setTitle(ButtonTitle.enableExtension.rawValue, for: .normal)
            bottomMessageLbl.isHidden = false
            textFieldOuterlayer.isHidden = true
            bottomMessageLbl.text = "This will take you to Safari and show you steps to do it"
            topLbl.text = "Swipe to sign in anywhere."
            middleLbl.text = "Save multiple addresses, passwords,\ncards & more."
            bottomLbl.text = "Autofill everything you save instantly."
            if let sheet = self.sheetPresentationController {
                sheet.detents = [
                    .custom(resolver: { _ in
                       return 100
                   }),
                    .custom(resolver: { context in
                    return context.maximumDetentValue * 0.55
                })]
            }
            MoveIn()
            break
        case ButtonTitle.enableExtension.rawValue:
            nextBtn.setTitle(ButtonTitle.detecting.rawValue, for: .normal)
            nextBtn.backgroundColor = lightGrayColor
            setupStepContainer.isHidden = true
            titleLbl.text = "Enable the Node Safari\nbrowser extension"
            if let sheet = self.sheetPresentationController {
                sheet.detents = [
                    .custom(resolver: { _ in
                       return 100
                   }),
                    .custom(resolver: { context in
                    return context.maximumDetentValue * 0.5
                })]
            }
            
//            var timer = Timer()
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(autoUpdateButtonTitle), userInfo: nil, repeats: true)
            MoveIn()
            break
        default:
            break
        }
    }
    
    @objc func autoUpdateButtonTitle() {
        switch nextBtn.titleLabel?.text {
        case ButtonTitle.detecting.rawValue:
            nextBtn.setTitle(ButtonTitle.extensionEnabled.rawValue, for: .normal)
            nextBtn.backgroundColor = greenColor
            indicatorImageView.image = UIImage(named: "PuzzleGreen")
            break
        case ButtonTitle.extensionEnabled.rawValue:
            nextBtn.setTitle(ButtonTitle.toDashboard.rawValue, for: .normal)
            break
        case ButtonTitle.toDashboard.rawValue:
            print("Taking you to Dashboard")
            timer.invalidate()
            break
        default:
            break
        }
    }
    
    func MoveIn() {        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.65)
        let trans = CATransition()
        trans.type = CATransitionType.push
        trans.subtype = CATransitionSubtype.fromTop
        self.view.layer.add(trans, forKey: nil)
        CATransaction.commit()
    }
}

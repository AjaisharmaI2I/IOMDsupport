//
//  ViewController.swift
//  CustomCellForSplash
//
//  Created by Ideas2IT on 21/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cSplashTableView: UITableView!
    @IBOutlet weak var saveAndContinueBtn: UIButton!
    @IBOutlet weak var pageTitleLbl: UILabel!
    
    var myDataArray: [MyData] = []
    var isCheckBoxClicked: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    myDataArray = [
        MyData(imageName: "Protection", titleMessage: "Keep your personal email private", subTitleMessage: "Highest level of protection against spam,\nemail clutter, hacking and phishing."),
        MyData(imageName: "Global", titleMessage: "Use instantly, and anywhere", subTitleMessage: "Save and remember any information\nautomatically. All your data, only with you."),
        MyData(imageName: "Thunder", titleMessage: "Eliminate all repetitive tasks", subTitleMessage: "One-touch, one-tap, swipe to fill\nTap, click swipe - once")
    ]
        
        
        cSplashTableView.register(UINib(nibName: "CSplashTableViewCell", bundle: nil), forCellReuseIdentifier: "CSplashTableViewCell")
        cSplashTableView.register(UINib(nibName: "MerchantAppOpenTableViewCell", bundle: nil), forCellReuseIdentifier: "MerchantAppOpenTableViewCell")
        
        pageTitleLbl.text = "🙂 \n Select below how you would \n you like node to help you"
        saveAndContinueBtn.backgroundColor = UIColor(hex: "#8877F2")
        saveAndContinueBtn.layer.cornerRadius = saveAndContinueBtn.frame.size.height / 2
        saveAndContinueBtn.addTarget(self, action: #selector(saveBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func onCheckMarkClicked(_ sender: UIButton) {
        myDataArray[sender.tag].isSelected = !myDataArray[sender.tag].isSelected
        if myDataArray[sender.tag].isSelected {
            print("selected")
        } else {
            print("de-selected")
        }
//        cSplashTableView.reloadData()
    }
    
    @objc func saveBtnPressed(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "Select All" :
            print("Selected All")
            saveAndContinueBtn.setTitle("Save And Continue", for: .normal)
            break
        case "Save And Continue":
            print("Navigating to next Page")
            myDataArray = [
                MyData(setupStep: "SETUP STEP 1/2", imageName: "ProtectionLock", titleMessage: "Keep your personal email private", subTitleMessage: "We will create a Node email id based off your private id that you can use instead. All your spam then comes to Node"),
                MyData(setupStep: "SETUP STEP 2/2", imageName: "Puzzle", titleMessage: "Never type online again", subTitleMessage: "Save your information instantly when you login anywhere and auto fill it when you go to the website again")
            ]
            cSplashTableView.reloadData()
            break
        default:
            break
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return myDataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch saveAndContinueBtn.titleLabel?.text {
        case "Select All":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CSplashTableViewCell", for: indexPath) as! CSplashTableViewCell
            cell.titleLbl.text = myDataArray[indexPath.section].titleMessage
            cell.indicatorImageView.image = UIImage(named: myDataArray[indexPath.section].imageName)
            cell.subTitle.text = myDataArray[indexPath.section].subTitleMessage
            
            cell.checkBtn.tag = indexPath.section
            cell.checkBtn.addTarget(self, action: #selector(onCheckMarkClicked(_:)), for: .touchUpInside)
            return cell
        case "Save And Continue":
            let cell = tableView.dequeueReusableCell(withIdentifier: "MerchantAppOpenTableViewCell", for: indexPath) as! MerchantAppOpenTableViewCell
            cell.titleLbl.text = myDataArray[indexPath.section].titleMessage
            cell.subtitleLbl.text = myDataArray[indexPath.section].subTitleMessage
            cell.sideImageView.image = UIImage(named: myDataArray[indexPath.section].imageName)
            cell.setupStepLbl.text = myDataArray[indexPath.section].setupStep
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
}


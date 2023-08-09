//
//  ForwadrSheetViewController.swift
//  ForwardSheet
//
//  Created by Ideas2it on 04/08/23.
//

import UIKit

class ForwadrSheetViewController: UIViewController {
    @IBOutlet weak var nodeLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var separatorView: UIView!
    
    @IBOutlet weak var forwardLbl: UILabel!
    @IBOutlet weak var emailListView: UITableView!
    @IBOutlet weak var emailListViewHeightConstrait: NSLayoutConstraint!
    
    @IBOutlet weak var orLbl: UILabel!
    @IBOutlet weak var leftSeparatorView: UIView!
    @IBOutlet weak var rightSeparatorView: UIView!
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var emailTextFieldView: UIView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var radioBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    
    var selecetedIndex : IndexPath?
    var isDefault = Bool()
    var myData = [MyData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myData = [
            MyData(title: "Emails", options: [
                ["email": "aditya.m134@gmail.com1", "isDefault" : false],
                ["email": "aditya.m134@gmail.com2", "isDefault" : false],
                ["email": "aditya.m134@gmail.com3", "isDefault" : false]
        ])
        ]
        
        
        view.backgroundColor = .black.withAlphaComponent(0.90)
        
        separatorView.backgroundColor = .black.withAlphaComponent(0.90)
        separatorView.layer.shadowColor = UIColor.black.cgColor
        separatorView.layer.shadowRadius = 2
        separatorView.layer.shadowOffset = CGSize(width: 0, height: -2)
        separatorView.layer.shadowOpacity = 0.8
        
        emailListView.layer.cornerRadius = 24
        emailListView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        emailListView.register(UINib(nibName: "EmailsTableViewCell", bundle: nil), forCellReuseIdentifier: "EmailsTableViewCell")
        
        orLbl.textColor = UIColor(hex: "#C4C4C4")
        leftSeparatorView.backgroundColor = UIColor(hex: "#DBDBDB")
        rightSeparatorView.backgroundColor = UIColor(hex: "#DBDBDB")
        
        emailTextFieldView.layer.cornerRadius = 8
        emailTextFieldView.layer.masksToBounds = true
        emailTF.backgroundColor = UIColor(hex: "#D3D2DB")
        
        radioBtn.titleLabel?.textColor = UIColor(hex: "#CCC8E5")
        
        forwardBtn.layer.cornerRadius = forwardBtn.frame.height / 2
        forwardBtn.backgroundColor = UIColor(hex: "#8877F2")
    }
}

extension ForwadrSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 55
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = myData[section]
        
        if data.isExpanded {
            return data.options.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let headCell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
            
            let options = myData[0].options
            
            for op in options {
                if op["isDefault"] as? Bool == true {
                    headCell.selectedOptLbl.text = op["email"] as? String
                    break
                }
            }
            headCell.descLbl.textColor = UIColor(hex: "#8877F2")
            headCell.iconImage.tintColor = UIColor(hex: "#8877F2")
            headCell.radioBtn.isHidden = true
            headCell.dropDownBtn.addTarget(self, action: #selector(dropDownPressed), for: .touchUpInside)
            return headCell
        } else {
            let emailsCell = tableView.dequeueReusableCell(withIdentifier: "EmailsTableViewCell", for: indexPath) as! EmailsTableViewCell
            
            emailsCell.radioBtn.tag = indexPath.row
            emailsCell.radioBtn.addTarget(self, action: #selector(emailSelected), for: .touchUpInside)
            
            emailsCell.radioBtn.isSelected = (indexPath == selecetedIndex)
            emailsCell.radioBtn.setImage(UIImage(named: "radio_selected"), for: .selected)
            emailsCell.radioBtn.setImage(UIImage(named: "radio_deselected"), for: .normal)
            
            emailsCell.emailLbl.text = myData[indexPath.section].options[indexPath.row - 1]["email"] as? String
            return emailsCell
        }
        
    }
    
    @objc func dropDownPressed(_ sender: UIButton) {
        let section = sender.tag
        myData[section].isExpanded = !myData[section].isExpanded
        changeTableViewHeight(section: section)
    }
    
    @objc func emailSelected(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        myData[indexPath.section].isExpanded = !myData[indexPath.section].isExpanded
        changeTableViewHeight(section: indexPath.section)
        
        if selecetedIndex == indexPath {
            selecetedIndex = nil
        } else {
            selecetedIndex = indexPath
        }
        
        for i in 0..<myData[0].options.count {
            if i == sender.tag - 1 {
                myData[0].options[i]["isDefault"] = true as Bool
            } else {
                myData[0].options[i]["isDefault"] = false as Bool
            }
        }
        emailListView.reloadData()
    }
    
    func changeTableViewHeight(section: Int) {
        let indexPath = IndexPath(row: 0, section: section)
        let headCell = emailListView.cellForRow(at: indexPath) as! MyTableViewCell
        
        if myData[section].isExpanded {
            emailListViewHeightConstrait.constant = 15
            headCell.radioBtn.isHidden = false
            orLbl.isHidden = true
            leftSeparatorView.isHidden = true
            rightSeparatorView.isHidden = true
            emailListView.reloadData()
        } else {
            emailListViewHeightConstrait.constant = 193
            orLbl.isHidden = false
            leftSeparatorView.isHidden = false
            rightSeparatorView.isHidden = false
            headCell.radioBtn.isHidden = true
        }
        
        self.emailListView.reloadSections([section], with: .none)
    }
}

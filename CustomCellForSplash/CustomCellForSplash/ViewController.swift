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
    
    var titleArray = ["Keep your personal email private", "Use instantly, and anywhere", "Eliminate all repetitive tasks"]
    var subtitleArray = ["Highest level of protection against spam,\nemail clutter, hacking and phishing.", "Save and remember any information\nautomatically. All your data, only with you.", "One-touch, one-tap, swipe to fill\nTap, click swipe - once"]
    var indicatorImages = ["Protection", "Global", "Thunder"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cSplashTableView.register(UINib(nibName: "CSplashTableViewCell", bundle: nil), forCellReuseIdentifier: "CSplashTableViewCell")
        
        pageTitleLbl.text = "🙂 \n Select below how you would \n you like node to help you"
        saveAndContinueBtn.backgroundColor = UIColor(hex: "#8877F2")
        saveAndContinueBtn.layer.cornerRadius = saveAndContinueBtn.frame.size.height / 2
    }
    
    @objc func buttonSelected() {
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "CSplashTableViewCell", for: indexPath) as! CSplashTableViewCell
        cell.titleLbl.text = titleArray[indexPath.row]
        cell.indicatorImageView.image = UIImage(named: indicatorImages[indexPath.row])
        cell.subTitle.text = subtitleArray[indexPath.row]
        return cell
    }
}


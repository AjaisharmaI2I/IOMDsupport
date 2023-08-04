//
//  ViewController.swift
//  SlidingView
//
//  Created by Ideas2IT on 01/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thridView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var enableBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var creatBtn: UIButton!
    @IBOutlet weak var viewBtn: UIButton!
    @IBOutlet weak var firstViewCenterLayout: NSLayoutConstraint!
    @IBOutlet weak var secondViewCenterLayout: NSLayoutConstraint!
    @IBOutlet weak var thirdViewCenterLayout: NSLayoutConstraint!
    @IBOutlet weak var fourthViewCenterLayout: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        secondView.isHidden = true
        enableBtn.setTitle("enable", for: .normal)
        enableBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        nextBtn.setTitle("next", for: .normal)
        nextBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        creatBtn.setTitle("create", for: .normal)
        creatBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        viewBtn.setTitle("view", for: .normal)
        viewBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        secondViewCenterLayout.constant += view.bounds.width
        thirdViewCenterLayout.constant += view.bounds.width
        fourthViewCenterLayout.constant += view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func buttonPressed(_ sender : UIButton){
        switch sender.titleLabel?.text {
        case "enable":
            firstViewCenterLayout.constant -= view.bounds.width
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            
            secondViewCenterLayout.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            break
        case "next":
            secondViewCenterLayout.constant -= view.bounds.width
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            
            thirdViewCenterLayout.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            break
        case "create":
            thirdViewCenterLayout.constant -= view.bounds.width
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            
            fourthViewCenterLayout.constant = 0
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            break
        case "view":
            fourthViewCenterLayout.constant -= view.bounds.width
            UIView.animate(withDuration: 0.5, delay: 0.3) { [weak self] in
                self?.view.layoutIfNeeded()
            }
            print("You can view now")
            break
        default:
            break
        }
    }
}


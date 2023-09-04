//
//  ViewController.swift
//  DateFormatter
//
//  Created by Ideas2IT on 04/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hStack: UIStackView!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var indBtn: UIButton!
    @IBOutlet weak var usBtn: UIButton!
    @IBOutlet weak var ukBtn: UIButton!
    @IBOutlet weak var frBtn: UIButton!
    
    
    var date = Date()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "dd/MM/yyyy"
        dateLable.text = dateformatter.string(from: date)
        
        indBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
        ukBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
        usBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
        frBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
    }

    
    @objc func changeDateFormat(_ sender: UIButton) {
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        
        switch sender.titleLabel?.text {
            
        case "India", "FR":
            dateFormatter.dateFormat = "dd/MM/yyyy"
        case "US", "UK":
            dateFormatter.dateFormat = "MM/dd/yyyy"
        default:
            dateFormatter.dateFormat = "dd/MM/yyyy"
            break
        }
        
        print(dateFormatter.string(from: date))
        dateLable.text = dateFormatter.string(from: date)
    }
    
}


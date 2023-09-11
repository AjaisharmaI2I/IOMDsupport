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
////        let date = Date()
//         = dateformatter.string(from: date)
        
        indBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
        ukBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
        usBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
        frBtn.addTarget(self, action: #selector(changeDateFormat), for: .touchUpInside)
    }

    
    @objc func changeDateFormat(_ sender: UIButton) {
        
        var dateFormatter = DateFormatter()
        
        let countryOrRegion = Locale.current
        print(countryOrRegion)
        dateFormatter.locale = countryOrRegion
        dateFormatter.dateStyle = .short
        
        let formatedDate = dateFormatter.string(from: date)
        print(formatedDate)
        dateLable.text = formatedDate
    }
    
}


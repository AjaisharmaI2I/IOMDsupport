//
//  ViewController.swift
//  ForwardSheet
//
//  Created by Ideas2it on 04/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var presentBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentBtn.addTarget(self, action: #selector(presentSheet), for: .touchUpInside)
    }

    @objc func presentSheet() {
        print("pressed")
        let sheetVc = self.storyboard?.instantiateViewController(withIdentifier: "ForwadrSheetViewController") as! ForwadrSheetViewController
        
        if let sheet = sheetVc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20.0
        }
        
        sheetVc.isModalInPresentation = true
        
        self.navigationController?.present(sheetVc, animated: true)
    }


}


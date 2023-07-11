//
//  ViewController.swift
//  UpdatedSheetUI
//
//  Created by Ideas2IT on 06/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentBtn.addTarget(self, action: #selector(presentSheet), for: .touchUpInside)
    }
    
    @objc func presentSheet() {
        let sheetVc = self.storyboard?.instantiateViewController(withIdentifier: "SheetViewController") as! SheetViewController
        
        if let sheet = sheetVc.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20.0
        }
        
        sheetVc.isModalInPresentation = true
        
        self.navigationController?.present(sheetVc, animated: true)
    }


}


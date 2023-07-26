//
//  ViewController.swift
//  CustomerFlowBottomSheet
//
//  Created by Ideas2IT on 24/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentBtn.addTarget(self, action: #selector(presentBottomSheet), for: .touchUpInside)
    }
    
    @objc func presentBottomSheet() {
        let bottomSheetVC = self.storyboard?.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
        
        if let sheet = bottomSheetVC.sheetPresentationController {
            sheet.detents = [
                .custom(resolver: { _ in
                   return 100
               }),
                .custom(resolver: { context in
                    return context.maximumDetentValue * 0.7

                })]
            sheet.preferredCornerRadius = 16
        }
        bottomSheetVC.isModalInPresentation = true
        present(bottomSheetVC, animated: true)
    }


}


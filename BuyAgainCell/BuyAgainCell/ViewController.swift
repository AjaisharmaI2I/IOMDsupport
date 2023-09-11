//
//  ViewController.swift
//  BuyAgainCell
//
//  Created by Ideas2IT on 08/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "BuyAgainTableViewCell", bundle: nil), forCellReuseIdentifier: "BuyAgainTableViewCell")
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BuyAgainTableViewCell", for: indexPath) as! BuyAgainTableViewCell
        cell.buyAgainBtn.setTitle("Buy again", for: .normal)
        cell.buyAgainBtn.titleLabel?.numberOfLines = 1
        cell.stackContainer.bringSubviewToFront(cell.buyAgainBtn)
        
        if indexPath.row == 2 {
            cell.offerBtn.isHidden = false
        }
        cell.offerBtn.setImage(UIImage(named: "Offer"), for: .normal)
        return cell
    }
}


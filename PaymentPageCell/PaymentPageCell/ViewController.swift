//
//  ViewController.swift
//  PaymentPageCell
//
//  Created by Ideas2IT on 07/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    let titles = ["Apple", "ora"]
    let prices = ["150", "10"]
    @IBOutlet weak var myTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTable.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if titles.count == 1 {
            return 50
        } else if titles.count == 2 {
            return 60
        } else {
            return 70
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        cell.productImage.image = UIImage(named: "Apple")
        
        if titles.count == 1 {
            cell.view2.isHidden = true
            cell.view3.isHidden = true
            cell.title1.text = titles[indexPath.row]
            cell.price1.text = prices[indexPath.row]
        } else if titles.count == 2 {
            cell.view3.isHidden = true
            cell.title1.text = titles[indexPath.row]
            cell.title2.text = titles[indexPath.row + 1]
            
            cell.price1.text = prices[indexPath.row]
            cell.price2.text = prices[indexPath.row + 1]
        } else {
            cell.title1.text = titles[indexPath.row]
            cell.title2.text = titles[indexPath.row + 1]
            cell.title3.text = titles[indexPath.row + 2]
            
            cell.price1.text = prices[indexPath.row]
            cell.price2.text = prices[indexPath.row + 1]
            cell.price3.text = prices[indexPath.row + 2]
        }
        
        return cell
    }
}


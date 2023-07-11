//
//  ViewController.swift
//  NodeTableView
//
//  Created by Ideas2IT on 03/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var collectionBGView: UIView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var nodeData: [String: [String]] = ["Address" : ["123 Main Street, Los angeles CA 12345"],  "Phone" : ["9765567876"], "Email" : ["nodeme.mail"]]
    
    var nodeKeys = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionBGView.layer.cornerRadius = 10
        collectionBGView.layer.masksToBounds = true
        myTableView.register(UINib(nibName: "NodeTableViewCell", bundle: nil), forCellReuseIdentifier: "NodeTableViewCell")
        myTableView.register(UINib(nibName: "NodeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "NodeHeaderTableViewCell")
        nodeKeys = Array(nodeData.keys).sorted()
        bgView.layer.cornerRadius = 10
        bgView.layer.borderColor = UIColor.red.cgColor
        bgView.layer.masksToBounds = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(presentSheet))
    }
    
    @objc func presentSheet() {
        let sheetVc = self.storyboard?.instantiateViewController(withIdentifier: "SheetViewController") as! SheetViewController
        if let sheet = sheetVc.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        
        self.navigationController?.present(sheetVc, animated: true)
    }
}


// MARK: - Table view Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodeData.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if 0 == indexPath.row {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NodeHeaderTableViewCell", for: indexPath) as! NodeHeaderTableViewCell
            cell.productImage.image = UIImage(named: "wine")
            return cell
        } else {
            var icon = String()
            var subtitle = String()
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "NodeTableViewCell", for: indexPath) as! NodeTableViewCell
            
            let key = nodeKeys[indexPath.row-1]
            cell.titleLbl.text = key
            
            switch key {
            case "Address":
                icon = "house.fill"
                subtitle = "Your order is being delivered to the address"
                break
            case "Email":
                icon = "envelope.fill"
                cell.icon.tintColor = .purple
                subtitle = "You used your personal Email. No spam protected"
                break
            case "Phone":
                icon = "phone.fill"
                subtitle = "You will recive calls about your order on this number"
                break
            default:
                break
            }
            cell.subtitleLbl.text = subtitle
            cell.subtitleLbl.textColor = .purple
            cell.icon.image = UIImage(systemName: icon)
            cell.detailsLbl.numberOfLines = 0
            cell.detailsLbl.text = nodeData[key]?.first
            return cell
        }
    }
}

// MARK: - Collection View Extension
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCollectionViewCell", for: indexPath) as! OfferCollectionViewCell
        cell.productImage.image = UIImage(named: "wine")
        cell.offerLbl.text = "10%"
        cell.offerExpiryLbl.text = "6 days left"
        return cell
    }
    
    func configCollectionViewCell(_ cellName: UICollectionViewCell) {
    }
}

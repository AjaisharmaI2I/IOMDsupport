//
//  ViewController.swift
//  MenuHorizontalCollection
//
//  Created by Ideas2IT on 01/09/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var selectedOptionLbl: UILabel!
    
    var selectedIndexPath: IndexPath?
    
    var myDic : [[String:String]] = [
        ["icon" : "purchase", "title" : "purchase"],
        ["icon" : "message", "title" : "Message"],
        ["icon" : "sharing", "title" : "sharing"],
        ["icon" : "contact", "title" : "contact"],
        ["icon" : "interaction", "title" : "interaction"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myDic.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        if let imageStr = myDic[indexPath.row]["icon"] {
//            cell.menuIcon.image = UIImage(named: imageStr)
            
            var image = UIImage(named: imageStr)
            
            let templateImage = image?.withRenderingMode(.alwaysTemplate)
            cell.menuIcon.tintColor = UIColor.lightGray
            cell.menuIcon.image = templateImage
        }
        cell.menuLbl.text = myDic[indexPath.row]["title"]
        cell.lineView.isHidden = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let previousIndexPath = selectedIndexPath,
                   let previousCell = collectionView.cellForItem(at: previousIndexPath) as? MenuCollectionViewCell {
                    previousCell.lineView.isHidden = true
                    previousCell.menuLbl.textColor = .lightGray
                    previousCell.menuIcon.tintColor = .lightGray
                }
                
                if let selectedCell = collectionView.cellForItem(at: indexPath) as? MenuCollectionViewCell {
                    selectedCell.lineView.isHidden = false
                    selectedCell.menuIcon.tintColor = .black
                    selectedCell.menuLbl.textColor = .black
                    selectedOptionLbl.text = myDic[indexPath.item]["title"]
                }
                
                collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                
                selectedIndexPath = indexPath

    }
}

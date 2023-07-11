//
//  ViewController.swift
//  CollectionView
//
//  Created by Ideas2IT on 07/07/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myCollection: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        cell.productImage.image = UIImage(named: "wine")
        cell.percentLbl.text = "20%"
        cell.dayLeftLbl.text = "7 days left"
        return cell
    }
}




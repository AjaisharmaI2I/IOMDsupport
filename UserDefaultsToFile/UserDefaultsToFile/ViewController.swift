//
//  ViewController.swift
//  UserDefaultsToFile
//
//  Created by Ideas2IT on 10/08/23.
//

import UIKit

class ViewController: UIViewController {

   
    var myData: MyData?
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        let date = dateFormat.date(from: "16/06/99")
        
        var data = MyData(name: "ajai", age: 24, dob: date!, isLoggedIn: true, isActDeleted: false, phoneNumber: "9987779943")
        myData = data
//        saveToUserDefaults()
        displayUserDefaults()
        var timer = Timer()
        timer.invalidate()
        
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(callPreview), userInfo: nil, repeats: false)
        
        
//        defaults.removeObject(forKey: "myData")

    }
    
    @objc func callPreview() {
        print("timer Started")
        preview()
    }
    
    
    func saveToUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.set(myData?.name, forKey: "name")
        defaults.set(myData?.age, forKey: "age")
        defaults.set(myData?.isLoggedIn, forKey: "isLoggedIn")
        defaults.set(myData?.isActDeleted, forKey: "isActDeleted")
        defaults.set(myData?.phoneNumber, forKey: "phoneNumber")
//        defaults.set(String(myData?.dob), forKey: "dob")
        print("user defaults saved")
    }
    
    func displayUserDefaults() {
        let myDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = myDir.appendingPathComponent("user-defaults.json")
        let defaults = UserDefaults.standard
        let dir = defaults.dictionaryRepresentation()
        print(dir.keys)
        let defaultKeys = UserDefaults(suiteName: "")?.dictionaryRepresentation().keys
        let ourKeys = dir.keys.filter { key in
            return !defaultKeys!.contains(key)
        }
        var newData: [String: Any] = [:]
        for key in ourKeys {
            newData[key] = dir[key]
//            defaults.removeObject(forKey: key)
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: newData, options: [])
            try data.write(to: fileUrl)
            print(fileUrl.path)
        } catch {
            print("error")
        }
    }
    
    func preview() {
        let myDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = myDir.appendingPathComponent("user-defaults.json")
                let documentInteractionController = UIDocumentInteractionController(url: fileUrl)
                documentInteractionController.delegate = self
                documentInteractionController.presentPreview(animated: true)
    }
    
}

extension ViewController: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}


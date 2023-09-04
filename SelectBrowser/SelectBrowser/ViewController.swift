//
//  ViewController.swift
//  SelectBrowser
//
//  Created by Ideas2IT on 24/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var showBrowsersBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBrowsersBtn.addTarget(self, action: #selector(showBrowsers), for: .touchUpInside)
    }


    @objc func showBrowsers() {
        let actionSheet = UIAlertController(title: "Browser List", message: "Select the browser to Open the Link", preferredStyle: .actionSheet)
        var browsers : [String] = []
        
        let safariInstalled = UIApplication.shared.canOpenURL(URL(string: "http://www.apple.com/")!)
        let chromeInstalled = UIApplication.shared.canOpenURL(URL(string: "googlechrome://www.google.com")!)
        let firefoxInstalled = UIApplication.shared.canOpenURL(URL(string: "firefox://open-url?url=https://www.google.com")!)
        
        if safariInstalled {
            browsers.append("Safari")
        }
        
        if chromeInstalled {
            browsers.append("Chrome")
        }
        
        if firefoxInstalled {
            browsers.append("Firefox")
        }
        
        for browser in browsers {
            let browserAction = UIAlertAction(title: browser, style: .default) { _ in
                self.openBrowser(browser)
            }
            actionSheet.addAction(browserAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        actionSheet.addAction(cancelAction)
        
        present(actionSheet, animated: true)
    }
    
    func openBrowser(_ selectedBrowser: String) {
        switch selectedBrowser{
        case "Safari":
            print(selectedBrowser)
            UIApplication.shared.open(URL(string: "http://www.google.com/")!)
        case "Firefox":
            print(selectedBrowser)
        case "Chrome":
            print(selectedBrowser)
        default:
            break
        }
    }
}


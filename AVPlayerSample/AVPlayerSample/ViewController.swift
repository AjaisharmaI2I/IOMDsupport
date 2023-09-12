//
//  ViewController.swift
//  AVPlayerSample
//
//  Created by Ideas2IT on 12/09/23.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tryItBtn: UIButton!
    @IBOutlet weak var laterBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = Bundle.main.url(forResource: "sampleVideo", withExtension: "mp4")
        let avPlayer = AVPlayer(url: url!)
        let playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer.frame = playerView.bounds
        
        playerLayer.videoGravity = .resizeAspect
        playerView.layer.addSublayer(playerLayer)
        avPlayer.play()
        
        tryItBtn.addTarget(self, action: #selector(playBtnPressed(_:)), for: .touchUpInside)
        laterBtn.addTarget(self, action: #selector(playBtnPressed(_:)), for: .touchUpInside)
    }
    
    @objc func playBtnPressed(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "Let's try it":
            print("\(sender.titleLabel?.text) is pressed")
        case "Maybe later":
            print("\(sender.titleLabel?.text) is pressed")
        default:
            break
        }
    }


}


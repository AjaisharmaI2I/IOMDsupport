//
//  ViewController.swift
//  BackgroundTask
//
//  Created by Ideas2IT on 31/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!

    var timerCounting: Bool = false
    var startTime: Date?
    var stopTime: Date?
    
    let userDefault =  UserDefaults.standard
    let START_TIME_KEY = "startTime"
    let STOP_TIME_KEY = "stopTime"
    let COUNTING_KEY = "counting"

    var scheduleTimer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startTime = userDefault.object(forKey: START_TIME_KEY) as? Date
        stopTime = userDefault.object(forKey: STOP_TIME_KEY) as? Date
        timerCounting = userDefault.bool(forKey: COUNTING_KEY)
    }

    
    @objc func startStopTimer() {
        if timerCounting {
            setStopTimer(date: Date())
            stopTimer()
        } else {
            startTimer()
        }
    }
    
    
    func startTimer() {
        scheduleTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(refreshValue), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        
    }
    
    @objc func refreshValue() {
        
    }
    
    
    @objc func resetTimer() {
        
    }

    func setStartTimer(date: Date?) {
        startTime = date
        userDefault.set(startTime, forKey: START_TIME_KEY)
        
    }
    
    func setStopTimer(date: Date?) {
        stopTime = date
        userDefault.set(stopTime, forKey: STOP_TIME_KEY)
    }
    
    func setTimerCounting(_ isCounting : Bool) {
        timerCounting = isCounting
        userDefault.set(timerCounting, forKey: COUNTING_KEY)
    }
}


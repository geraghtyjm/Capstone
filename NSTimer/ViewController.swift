//
//  ViewController.swift
//  NSTimer
//
//  Created by Julia Geraghty on 9/24/17.
//  Copyright © 2017 Julia Geraghty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIBarButtonItem!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var timeLabel: UILabel!
    var counter = 0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pauseButton.isEnabled = false
    }
    
    @IBAction func startTimer(sender: AnyObject) {
        if isTimerRunning == false {
            runTimer()
        }
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        if self.resumeTapped == false {
            timer.invalidate()
            isTimerRunning = false
        } else {
            runTimer()
            self.resumeTapped = false
            isTimerRunning = true
        }
    }
    
    @IBAction func clearButton(sender: AnyObject) {
        
    }
    
    @objc func updateCounter() {
        counter = counter + 1
        timeLabel.text = timeString(time: TimeInterval(counter))
    }
    
    func runTimer() {
       timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateCounter)), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


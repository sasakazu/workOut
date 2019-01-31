//
//  interval.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit

class interval: UIViewController {


    @IBOutlet var timerMinute: UILabel!
    @IBOutlet var timerSecond: UILabel!
    @IBOutlet var timerMSec: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    
    weak var timer: Timer!
    var startTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 5.0
        stopButton.layer.cornerRadius = 5.0
        
        //        ぼかし
        timerMinute.layer.shadowColor = UIColor.black.cgColor
        timerMinute.layer.shadowOpacity = 0.3
        timerMinute.layer.shadowOffset = CGSize(width: 3, height: 3)
        timerMinute.layer.shadowRadius = 5
        
        //        ぼかし
        timerSecond
            .layer.shadowColor = UIColor.black.cgColor
        timerSecond.layer.shadowOpacity = 0.3
        timerSecond.layer.shadowOffset = CGSize(width: 3, height: 3)
        timerSecond.layer.shadowRadius = 5
        
        //        ぼかし
        timerMSec.layer.shadowColor = UIColor.black.cgColor
        timerMSec.layer.shadowOpacity = 0.3
        timerMSec.layer.shadowOffset = CGSize(width: 3, height: 3)
        timerMSec.layer.shadowRadius = 5
        
//        ぼかし
        startButton.layer.shadowColor = UIColor.black.cgColor
        startButton.layer.shadowOpacity = 0.5
        startButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        startButton.layer.shadowRadius = 5
  
//        ぼかし
        stopButton.layer.shadowColor = UIColor.black.cgColor
        stopButton.layer.shadowOpacity = 0.5
        stopButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        stopButton.layer.shadowRadius = 5

    }
    

    @IBAction func startBtn(_ sender: Any) {
        if timer != nil{
            // timerが起動中なら一旦破棄する
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(self.timerCounter),
            userInfo: nil,
            repeats: true)
        
        startTime = Date()
        
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        
        if timer != nil{
            timer.invalidate()
            
            timerMinute.text = "00"
            timerSecond.text = "00"
            timerMSec.text = "00"
        }
    }
    

    
    @objc func timerCounter() {
        // タイマー開始からのインターバル時間
        let currentTime = Date().timeIntervalSince(startTime)
        
        // fmod() 余りを計算
        let minute = (Int)(fmod((currentTime/60), 60))
        // currentTime/60 の余り
        let second = (Int)(fmod(currentTime, 60))
        // floor 切り捨て、小数点以下を取り出して *100
        let msec = (Int)((currentTime - floor(currentTime))*100)
        
        // %02d： ２桁表示、0で埋める
        let sMinute = String(format:"%02d", minute)
        let sSecond = String(format:"%02d", second)
        let sMsec = String(format:"%02d", msec)
        
        timerMinute.text = sMinute
        timerSecond.text = sSecond
        timerMSec.text = sMsec
        
    }
    

    
}

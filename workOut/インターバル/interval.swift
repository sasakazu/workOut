//
//  interval.swift
//  workOut
//
//  Created by 笹倉一也 on 2019/01/12.
//  Copyright © 2019 笹倉一也. All rights reserved.
//

import UIKit

class interval: UIViewController {


    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 5.0
        stopButton.layer.cornerRadius = 5.0
        resetButton.layer.cornerRadius = 7.0
        

    }
    



}

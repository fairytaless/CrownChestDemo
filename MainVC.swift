//
//  ViewController.swift
//  CrownChestDemo
//
//  Created by Lee Yuan-Shiou on 2018/7/21.
//  Copyright © 2018年 Lee Yuan-Shiou. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    var timer = Timer()
    var isProgressing = false
    @IBOutlet weak var lbInfo: UILabel!
    @IBOutlet weak var pvCrown: UIProgressView!
    var inputCrown = 0
    var totalCrown: Int = 0
    var count = 5
    
    
    @IBAction func btPlusCrown(_ sender: UIButton) {
        if isProgressing == false {
            inputCrown = sender.tag
        }else{
            inputCrown = sender.tag - sender.tag
        }
        totalCrown = totalCrown + inputCrown

            if totalCrown <= 10 {
                
            pvCrown.progress = Float(totalCrown) * 0.1
                timer.invalidate()
            }else{
            
            totalCrown = totalCrown - 10
            pvCrown.progress = Float(totalCrown) * 0.1
                timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)

            }
        lbInfo.text = "\(totalCrown)/10"
        
    }
    
    @objc func countDown() {
        isProgressing = true
        lbInfo.text = "\(count)s"
        count = count - 1
        if count < 0 {
            timer.invalidate()
            lbInfo.text = "\(totalCrown)/10"
            count = 5
            isProgressing = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbInfo.text = "0/10"
        pvCrown.progress = 0.0
        // Do any additional setup after loading the view, typically from a nib.
    }

}


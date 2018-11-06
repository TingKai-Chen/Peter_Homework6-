//
//  ViewController.swift
//  Peter_Homework6
//
//  Created by 陳庭楷 on 2018/11/3.
//  Copyright © 2018年 陳庭楷. All rights reserved.
//
import UIKit

import GameplayKit

var count = 6

var max = 50

var min = 0

class ViewController: UIViewController {
    
    var lowNumber = min
    
    var highNumner = max
    
    var againCount = count
    
    var randomNumber = 0

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var displayTimesLabel: UILabel!
    
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func send(_ sender: Any) {
        
        let turnInputNumber = self.inputTextField.text!
        
        guard let inputNumber = Int(turnInputNumber) else { return }
        
        guard inputNumber > self.lowNumber , inputNumber <= self.highNumner else {
            
            let alert = UIAlertController(title: "請輸入範圍之間的數字", message:
                
                nil, preferredStyle: .alert)
            
            let action_ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alert.addAction(action_ok)
            
            self.present(alert, animated: true, completion: nil)
            
            return
            
        }
        
        if self.randomNumber > inputNumber {
            
           self.answerLabel.text = "太少了(\(inputNumber)~\(self.highNumner))"
            
           self.lowNumber = inputNumber
            
           count -= 1
            
           self.displayTimesLabel.text = "還能猜\(count)次"
            
        }
        
        else if self.randomNumber < inputNumber {
            
            self.answerLabel.text = "太多了(\(self.lowNumber)~\(inputNumber))"
            
            self.highNumner = inputNumber
            
            count -= 1
            
            self.displayTimesLabel.text = "還能猜\(count)次"
            
        }
        
        else {
            
            self.answerLabel.text = "恭喜你答對了"
            
            self.sendButton.isEnabled = false
            
            self.displayTimesLabel.text = "還能猜\(count)次"
            
        }
        
        if count == 0 {
            
            self.answerLabel.text = "你太遜了"
            
            self.sendButton.isEnabled = false
            
            self.displayTimesLabel.text = "還能猜\(count)次"
            
        }
        
    }
    
    @IBAction func again(_ sender: Any) {
        
        guess()
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guess()

    }
    
    func guess() {
        
        self.lowNumber = min
        
        self.highNumner = max
        
        let number = GKRandomDistribution(lowestValue: self.lowNumber, highestValue: self.highNumner)
        
        self.randomNumber = number.nextInt()
        
        self.answerLabel.text = "快來猜猜看"
        
        count = self.againCount
        
        displayTimesLabel.text = "還能猜\(count)次"
        
        sendButton.isEnabled = true
        
    }
    
}

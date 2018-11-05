//
//  ViewController.swift
//  23rd_HW_2
//
//  Created by 양어진 on 15/10/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zeroBtn: UIButton!
    @IBOutlet weak var oneBtn: UIButton!
    @IBOutlet weak var twoBtn: UIButton!
    @IBOutlet weak var threeBtn: UIButton!
    @IBOutlet weak var fourBtn: UIButton!
    @IBOutlet weak var fiveBtn: UIButton!
    @IBOutlet weak var sixBtn: UIButton!
    @IBOutlet weak var sevenBtn: UIButton!
    @IBOutlet weak var eightBtn: UIButton!
    @IBOutlet weak var nineBtn: UIButton!
    @IBOutlet weak var divisionBtn: UIButton!
    @IBOutlet weak var multipleBtn: UIButton!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var equalBtn: UIButton!
    @IBOutlet weak var acBtn: UIButton!
    
    
    @IBOutlet weak var numLabel: UILabel!
    var num = 0.0
    var result = 0.0
    var op = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        oneBtn.layer.cornerRadius = oneBtn.frame.height * 0.5
        twoBtn.layer.cornerRadius = twoBtn.frame.height * 0.5
        zeroBtn.layer.cornerRadius = zeroBtn.frame.height * 0.5
        threeBtn.layer.cornerRadius = threeBtn.frame.height * 0.5
        fourBtn.layer.cornerRadius = fourBtn.frame.height * 0.5
        fiveBtn.layer.cornerRadius = fiveBtn.frame.height * 0.5
        sixBtn.layer.cornerRadius = sixBtn.frame.height * 0.5
        sevenBtn.layer.cornerRadius = sevenBtn.frame.height * 0.5
        eightBtn.layer.cornerRadius = eightBtn.frame.height * 0.5
        nineBtn.layer.cornerRadius = nineBtn.frame.height * 0.5
        
        divisionBtn.layer.cornerRadius = divisionBtn.frame.height * 0.5
        multipleBtn.layer.cornerRadius = multipleBtn.frame.height * 0.5
        minusBtn.layer.cornerRadius = minusBtn.frame.height * 0.5
        plusBtn.layer.cornerRadius = plusBtn.frame.height * 0.5
        equalBtn.layer.cornerRadius = equalBtn.frame.height * 0.5
        acBtn.layer.cornerRadius = acBtn.frame.height * 0.5
        
    }
    
    @IBAction func equalBtn(_ sender: UIButton) {
        if(num != 0) {
            if (op=="+"){
                result += num
            } else if (op=="-"){
                result -= num
            } else if (op=="*"){
                result *= num
            } else if (op=="/"){
                result /= num
            }
            numLabel.text = String(result)
            num = 0
            result = 0
        }
    }
    
    @IBAction func acBtn(_ sender: UIButton) {
        //num = num/10
        num = 0
        result = 0
        numLabel.text = String(num)
    }
    
    @IBAction func plusBtn(_ sender: UIButton) {
        op = "+"
        result += num
        numLabel.text = String(result)
        num = 0
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        op = "-"
        result += num
        num = 0
    }
    
    @IBAction func multiplyBtn(_ sender: UIButton) {
        op = "*"
        result = 1
        result *= num
        numLabel.text = String(result)
        num = 0
    }
    
    @IBAction func divisionBtn(_ sender: UIButton) {
        op = "/"
        result += num
        num = 0
    }
    
    @IBAction func zeroBtn(_ sender: UIButton) {
        if (num==0){
            numLabel.text = String(num)
        } else {
            num = 10*num + 0
            numLabel.text = String(num)
        
        }
    }

    @IBAction func oneBtn(_ sender: UIButton) {
        if (num==0.0){
            num = 1.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 1
            numLabel.text = String(num)
          
        }
    }

    @IBAction func twoBtn(_ sender: UIButton) {
        if (num==0.0){
            num = 2.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 2
            numLabel.text = String(num)
            
        }
    }

    @IBAction func threeBtn(_ sender: UIButton) {
        if (num==0){
            num = 3.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 3
            numLabel.text = String(num)
        }
    }

    
    
    @IBAction func fourBtn(_ sender: UIButton) {
        if (num==0){
            num = 4.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 4
            numLabel.text = String(num)
      
        }
    }
    
    @IBAction func fiveBtn(_ sender: UIButton) {
        if (num==0){
            num = 5.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 5
            numLabel.text = String(num)
   
        }
    }
    
    @IBAction func sixBtn(_ sender: UIButton) {
        if (num==0){
            num = 6.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 6
            numLabel.text = String(num)
     
        }
    }
    
    @IBAction func sevenBtn(_ sender: UIButton) {
        if (num==0){
            num = 7.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 7
            numLabel.text = String(num)
       
        }
    }
    
    @IBAction func eightBtn(_ sender: UIButton) {
        if (num==0){
            num = 8.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 8
            numLabel.text = String(num)
       
        }
    }
    
    @IBAction func nineBtn(_ sender: UIButton) {
        if (num==0){
            num = 9.0
            numLabel.text = String(num)
        } else {
            num = 10*num + 9
            numLabel.text = String(num)
   
        }
    }
    
    
    
}


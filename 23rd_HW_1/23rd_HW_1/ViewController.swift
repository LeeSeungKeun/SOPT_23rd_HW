//
//  ViewController.swift
//  23rd_HW_1
//
//  Created by 양어진 on 09/10/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    @IBAction func loginBtn(_ sender: Any) {
        
        guard let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        if emailTF.text == "" || pwTF.text == ""  {
        } else {
            thirdVC.idData = emailTF.text
            navigationController?.present(thirdVC, animated: true)
        }
        
    }
    @IBAction func signupBtn(_ sender: Any) {

        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondViewController") else {
            return
        }
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        emailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        pwTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
    }
    
    @objc func isValid(){
        if !(pwTF.text?.isEmpty)! && !(emailTF.text?.isEmpty)! {
            loginBtn.isEnabled = true
            loginBtn.backgroundColor = #colorLiteral(red: 0.2503596544, green: 0.2951783538, blue: 0.6124226451, alpha: 1)
            
        } else {
            loginBtn.isEnabled = false
            loginBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }

}


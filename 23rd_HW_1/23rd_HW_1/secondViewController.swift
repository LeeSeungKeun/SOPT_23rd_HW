//
//  secondViewController.swift
//  23rd_HW_1
//
//  Created by 양어진 on 09/10/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    @IBAction func signupBtn(_ sender: Any) {
    
        guard let thirdVC = storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else { return }
        
        if emailTF.text == "" || pwTF.text == "" || nameTF.text == "" {
            
        } else {
            thirdVC.idData = emailTF.text
            thirdVC.nameData = nameTF.text
            navigationController?.present(thirdVC, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // 전부 입력해야 버튼 활성화
        signupBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        emailTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        pwTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
        nameTF.addTarget(self, action: #selector(isValid), for: .editingChanged)
    }
    
    @objc func isValid(){
        if !(emailTF.text?.isEmpty)! && !(pwTF.text?.isEmpty)! && !(nameTF.text?.isEmpty)!{
            signupBtn.isEnabled = true
            signupBtn.backgroundColor = #colorLiteral(red: 0.2503596544, green: 0.2951783538, blue: 0.6124226451, alpha: 1)

        } else {
            signupBtn.isEnabled = false
            signupBtn.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }

}

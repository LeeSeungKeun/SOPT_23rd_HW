//
//  SignupVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var partTF: UITextField!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signupAction(_ sender: Any) {
        
        UserService.shared.signUp(name: nameTF.text!, email: emailTF.text!, password: pwTF.text!, part: partTF.text!) {
            
            self.simpleAlertwithHandler(title: "회원가입 완료!", message: "") { (okHandler) in
                    self.toLoginPage()
            }
            
        }
    }
    
    func toLoginPage(){
        let LoginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present(LoginVC, animated: true, completion: nil)
    }

}

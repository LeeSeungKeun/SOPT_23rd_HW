//
//  LoginVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

//    let userdefault = UserDefaults.standard

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginAction(_ sender: UIButton) {
        loginCheck()
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        toSignUpPage()
    }
    
    
    
    func loginCheck(){
        LoginService.shared.login(email: emailTF.text!, password: pwTF.text!) { (res) in
            //            내..토큰.. 입니당..,,ㅠ
            if res.token == "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJEb0lUU09QVCIsInVzZXJfaWR4Ijo5N30.G0CvP4W8qm7oxNzA2yCpHcvKR5lyT6Bj6GomrOitETc" {
                self.toBoardPage()
            }
        }
    }
    
    
    func toBoardPage(){
        if emailTF.text != "" && pwTF.text != "" {
//            userdefault.set(gsno(emailTF.text), forKey: "email")
//            userdefault.set(gsno(pwTF.text), forKey: "password")
            //present
            let boardVCNavi = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "boardVCNavi")
            self.present(boardVCNavi, animated: true, completion: nil)
        }
    }
    
    func toSignUpPage(){
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

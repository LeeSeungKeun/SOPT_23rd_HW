//
//  LoginVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var pwTF: UITextField!
    

    let userDefault = UserDefaults.standard
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        if(emailTF.text == "" || pwTF.text == ""){
            simpleAlert(title: "경고!", message: "이메일과 비밀번호를 입력해주세용")
            
        } else {
            LoginService.shared.login(email: emailTF.text!, password: pwTF.text!) { (token) in
                
                self.userDefault.set(token.token, forKey: "token")
                self.simpleAlertwithHandler(title: "로그인 성공", message: "게시판으로 들어가시겠습니까~?~?") {
                    (okHandler) in
                    self.toBoardPage()
                }
            }
        }
        
    }
    
    
    
    @IBAction func signupAction(_ sender: UIButton) {

        toSignupPage()
    }
    
    
    func toSignupPage(){
        //push -> SignupVC
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "SignupVC") else { return }
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    func toBoardPage(){
        //push -> BoardVC
        let boardVC = storyboard?.instantiateViewController(withIdentifier: "BoardVC")
        navigationController?.pushViewController(boardVC!, animated: true)
    }
    
}

//
//  UIViewController+extensions.swift
//  iOS-NetworkSeminar
//
//  Created by 양어진 on 25/11/2018.
//  Copyright © 2018 sopt. All rights reserved.
//

//옵셔널 쉽게 해제시킬 수 있는 extension
import Foundation
import UIKit

extension UIViewController {
    func simpleAlert(_ title: String, _ msg: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: completion)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    func gsno(_ value:String?) -> String{
        guard let value_ = value else {
            return ""
        }
        return value_
    }//func gsno
    
    func gino(_ value:Int?) -> Int{
        guard let value_ = value else {
            return 0
        }
        return value_
    }//func gino
    
    func gbno(_ value:Bool?) -> Bool{
        guard let value_ = value else {
            return false
        }
        return value_
    }//func gbno
    
    func gfno(_ value:Float?) -> Float{
        guard let value_ = value else{
            return 0
        }
        return value_
    }//func gfno
}

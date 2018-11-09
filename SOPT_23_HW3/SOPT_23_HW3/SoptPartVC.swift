//
//  SoptPartVC.swift
//  SOPT_23_seminar3
//
//  Created by 양어진 on 06/11/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class SoptPartVC: UIViewController {

    @IBOutlet weak var partTF: UITextField!
    @IBOutlet weak var partImg: UIImageView!
    
    var picker: UIPickerView!
    var toolbar: UIToolbar!
    
    let parts: [String] = ["iOS", "안드로이드", "디자인", "기획"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPicker()
        setupToolbar()
    }
    
    func setupPicker() {
        picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        partTF.inputView = picker
    }
    
    
    func setupToolbar() {
        
        toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 40))
        
        let done = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(selectPart))
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.setItems([space, done], animated: true)
        
        partTF.inputAccessoryView = toolbar
    }
    
    @objc func selectPart() {
        let row = picker.selectedRow(inComponent: 0)
        let part = parts[row]
        partTF.text = part
        
       
        switch part {
        case "기획":
            partImg.image = UIImage(named: "sopt_doplan")
        case "디자인":
            partImg.image = UIImage(named: "sopt_dodesign")
        case "서버", "안드로이드", "iOS":
            partImg.image = UIImage(named: "sopt_dodevelop")
        default:
            break
        }
        
        partTF.endEditing(true)
    }
    
    
    
}


extension SoptPartVC: UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return parts[row]
    }
}


extension SoptPartVC: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return parts.count
    }
}

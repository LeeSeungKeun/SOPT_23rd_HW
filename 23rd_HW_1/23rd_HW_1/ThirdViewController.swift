//
//  ThirdViewController.swift
//  23rd_HW_1
//
//  Created by 양어진 on 09/10/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var idData : String?
    var nameData : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func setup() {
        //전달받은 data에 값이 있다면 label의 text를 설정해 줍니다.
        if let transIdData = idData {
            idLabel.text = transIdData
        }
        if let transNameData = nameData {
            nameLabel.text = transNameData
        }
    }
}

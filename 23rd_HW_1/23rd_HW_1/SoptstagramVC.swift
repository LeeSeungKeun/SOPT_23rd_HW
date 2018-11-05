//
//  SoptstagramVC.swift
//  23rd_HW_1
//
//  Created by 양어진 on 10/10/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class SoptstagramVC: UIViewController {
    var isLike : Bool = false
    @IBOutlet weak var likeLabel: UILabel!
    @IBAction func heartBtn(_ sender: UIButton) {
        
        //좋아요
        if isLike {
            isLike = false
            sender.setImage(UIImage(named: "heartEmpty"), for: .normal)
            likeLabel.isHidden = true
        } else {
            isLike = true
            sender.setImage(UIImage(named: "heartFull"), for: .normal)
            likeLabel.isHidden = false
        }
    }
    @IBOutlet weak var profileImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

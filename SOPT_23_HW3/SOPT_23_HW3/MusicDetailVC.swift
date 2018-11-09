//
//  MusicDetailVC.swift
//  SOPT_23_seminar3
//
//  Created by 양어진 on 06/11/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class MusicDetailVC: UIViewController {
    var albumImg: UIImage?
    var musicTitle: String?
    var singer: String?

    @IBOutlet weak var albumImgView: UIImageView!
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumImgView.image = albumImg
        musicTitleLabel.text = musicTitle
        singerLabel.text = singer
        
        albumImgView.layer.cornerRadius = 5
        albumImgView.layer.masksToBounds = true
        
    }
    

}

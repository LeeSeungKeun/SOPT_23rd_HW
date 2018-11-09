//
//  MusicCell.swift
//  SOPT_23_seminar3
//
//  Created by 양어진 on 06/11/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class MusicCell: UITableViewCell {

    @IBOutlet weak var albumImg: UIImageView!
    @IBOutlet weak var musicTitle: UILabel!
    @IBOutlet weak var singer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImg.layer.cornerRadius = 3
        albumImg.layer.masksToBounds = true
    }

}

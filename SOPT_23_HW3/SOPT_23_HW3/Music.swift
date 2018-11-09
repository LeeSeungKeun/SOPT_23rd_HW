//
//  Music.swift
//  SOPT_23_seminar3
//
//  Created by 양어진 on 06/11/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import Foundation
import UIKit


struct Music {
    var albumImg: UIImage?
    var musicTitle: String
    var singer: String
    
    init(title: String, singer: String, coverName: String) {
        self.albumImg = UIImage(named: coverName)
        self.musicTitle = title
        self.singer = singer
    }
}

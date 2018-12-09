//
//  DetailBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class DetailBoardVC: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentView: UITextView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var heartImgView: UIImageView!
    @IBOutlet weak var contentImg: UIImageView!
    
    
    var boardList = [Board]()

    var nameLab: String?
    var timeLab: String?
    var titleLab: String?
    var contentV: String?
    var likeLab: String?
    var heartOnOff: UIImageView?
    var contentImgV: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardInit()
        content()
    }
    
    func boardInit(){
//        contentImg = contentImgV
//        contentImg.image = contentImgV?.image
//        heartImgView.image = heartOnOff?.image
        likeLabel.text = likeLab
        contentView.text = contentV
        titleLabel.text = titleLab
        nameLabel.text = nameLab
        timeLabel.text = timeLab

        
    }
    
    func content(){
        let boardDetail = boardList
        
//        titleLab = boardDetail
//        contentV = boardDetail.boardContents
//        likeLab = "좋아요 " + "\(boardDetail.boardLike!)"+"개"
//        contentImg?.kf.setImage(with: URL(string: gsno(boardDetail.boardPhoto)), placeholder: UIImage())

        
    }
    
    
    
}

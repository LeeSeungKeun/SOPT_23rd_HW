//
//  DetailBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class DetailBoardVC: UIViewController {
 
    @IBOutlet weak var nameDetailLabel: UILabel!
    @IBOutlet weak var dateDetailLabel: UILabel!
    @IBOutlet weak var boardDetailImg: UIImageView!
    @IBOutlet weak var textDetailView: UITextView!
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var likeImg: UIImageView!
    @IBOutlet weak var likeDetailLabel: UILabel!
    
    var detailBoardImg : String?
    var detailTitle : String?
    var detailName : String?
    var detailContents : String?
    var detailLikeCount : String?
    var detailLikeImg : String?
    var detailDate : String?
    
    
//    var boardList = [Board]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        BoardService.shared.getBoardDetail(id: nil) { (data) in
//            let boardDetail = boardList.
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleDetailLabel.text = detailTitle
        textDetailView.text = detailContents
        nameDetailLabel.text = detailName
        likeDetailLabel.text = detailLikeCount
        boardDetailImg.imageFromUrl(detailBoardImg, defaultImgPath: "")
        dateDetailLabel.text = detailDate
    }
    

   

}

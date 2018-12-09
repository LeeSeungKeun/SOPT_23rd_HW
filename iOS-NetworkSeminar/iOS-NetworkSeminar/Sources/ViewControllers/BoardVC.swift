//
//  BoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class BoardVC: UIViewController {
    @IBOutlet weak var boardTableView: UITableView!
    
    var boardList = [Board]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boardTableView.delegate = self
        boardTableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        BoardService.shared.getBoardList(offset: nil, limit: nil) {[weak self] (data) in
            guard let `self` = self else {return}
            self.boardList = data
            self.boardTableView.reloadData()
        }
    }


}

extension BoardVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection \(boardList.count)")
        return boardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        print("cellForRowAt")
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! BoardCell
        let board = boardList[indexPath.row]
        
        cell.titleLabel.text = board.boardTitle
        cell.contentsLabel.text = board.boardContents
        cell.likeLabel.text = "좋아요 \(String(board.boardLike!))개"
        cell.nameLabel.text = "\(String(board.userId!))"
        cell.boardImg.imageFromUrl(gsno(board.boardPhoto), defaultImgPath: "")
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd HH:mm"
        cell.dateLabel.text = formatter.string(from: board.boardDate ?? Date())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "DetailBoardVC") as! DetailBoardVC
        let boardDetail = boardList[indexPath.row]

        nextVC.detailTitle = boardDetail.boardTitle!
        nextVC.detailContents = boardDetail.boardContents!
        nextVC.detailBoardImg = boardDetail.boardPhoto
        nextVC.detailLikeCount = "좋아요 \(String(boardDetail.boardLike!))개"
        nextVC.detailName = "\(String(boardDetail.userId!))"
        
        
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd HH:mm"
//        nextVC.detailDate = formatter.string(from: )
        

        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
}

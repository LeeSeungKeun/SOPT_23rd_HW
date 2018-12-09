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
        boardInit()
    }
    
    func boardInit() {
        BoardService.shared.getBoardList { [weak self] (data) in
            guard let `self` = self else {return}
            self.boardList = data
            self.boardTableView.reloadData()
        }
    }
    
    @IBAction func writeAction(_ sender: UIBarButtonItem) {
        let dvc = storyboard?.instantiateViewController(withIdentifier: "WriteBoardVC") as? WriteBoardVC
        self.present(dvc!, animated: true, completion: nil)
    }
    
    @IBAction func unwindToBoard(_ unwindSegue: UIStoryboardSegue){
        performSegue(withIdentifier: "BoardVC", sender: self)
    }
    
}

extension BoardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boardList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = boardTableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! BoardCell
        let board = boardList[indexPath.row]
    
        
        cell.titleLabel?.text = board.boardTitle
        cell.contentsLabel?.text = board.boardContents
        cell.imgView?.imageFromUrl(gsno(board.boardPhoto), defaultImgPath: "")
        
        //시간 왜안돼~?
//        let formatter = DateFormatter()
//        cell.timeLabel?.text = formatter.string(from: board.boardDate!)
        
        cell.likeLabel?.text = "좋아요 " + "\(board.boardLike!)"+"개"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "DetailBoardVC") as! DetailBoardVC
        
        let boardDetail = boardList[indexPath.row]

        nextVC.titleLab = boardDetail.boardTitle
        nextVC.contentV = boardDetail.boardContents
        nextVC.likeLab = "좋아요 " + "\(boardDetail.boardLike!)"+"개"

//        시간 어떻게해 ^_^
//        let formatter = DateFormatter()
//        nextVC.timeLab = formatter.string(from: boardDetail.boardDate!)

        //사진 어떻게해~? 안.나.와.ㅋ.
//        nextVC.contentImgV?.kf.setImage(with: URL(string: gsno(boardDetail.boardPhoto)), placeholder: UIImage())
        nextVC.contentImgV?.imageFromUrl(gsno(boardDetail.boardPhoto), defaultImgPath: "")
        
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
  
}

//MARK: -  서버통신 익스텐션
//FIXME: - 뭐 고쳐야한다.
//NSObject



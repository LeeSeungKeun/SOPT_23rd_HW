//
//  MusicVC.swift
//  SOPT_23_seminar3
//
//  Created by 양어진 on 06/11/2018.
//  Copyright © 2018 양어진. All rights reserved.
//

import UIKit

class MusicVC: UIViewController {
    @IBOutlet weak var musicTable: UITableView!
    @IBOutlet weak var editBtn: UIBarButtonItem!

    var musicList: [Music] = []
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setMusicData()

        musicTable.delegate = self
        musicTable.dataSource = self
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)

        if let index = musicTable.indexPathForSelectedRow{
            musicTable.deselectRow(at: index, animated: true)
        }
    }
    
    
    @IBAction func setEditingModeTableView(_ sender: Any) {

        if musicTable.isEditing {
            editBtn.title = "edit"
            musicTable.setEditing(false, animated: true)
        } else {
            editBtn.title = "done"
            musicTable.setEditing(true, animated: true)
        }
    }
    
}


extension MusicVC: UITableViewDataSource {
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = musicTable.dequeueReusableCell(withIdentifier: "MusicCell") as! MusicCell
        
        let music = musicList[indexPath.row]
        
    
        cell.albumImg.image = music.albumImg
        cell.musicTitle.text = music.musicTitle
        cell.singer.text = music.singer
     
        return cell
    }
    
    
}



extension MusicVC: UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let nextVC = storyboard?.instantiateViewController(withIdentifier: "MusicDetail") as! MusicDetailVC
        let music = musicList[indexPath.row]
        nextVC.albumImg = music.albumImg
        nextVC.musicTitle = music.musicTitle
        nextVC.singer = music.singer
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movingIndex = musicList[sourceIndexPath.row]
        musicList.remove(at: sourceIndexPath.row)
        musicList.insert(movingIndex, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            musicList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension MusicVC {
    func setMusicData() {
        let music1 = Music(title: "삐삐", singer: "아이유", coverName: "album_iu")
        let music2 = Music(title: "가을 타나봐", singer: "바이브", coverName: "album_vibe")
        let music3 = Music(title: "고백", singer: "양다일", coverName: "album_yangdail")
        let music4 = Music(title: "하루도 그대를 사랑하지 않은 적이 없었다", singer: "임창정", coverName: "album_im")
        let music5 = Music(title: "Save (Feat. 팔로알토)", singer: "루피(Loopy)", coverName: "album_smtm7")
        let music6 = Music(title: "멋지게 인사하는 법 (Feat. 슬기)", singer: "Zion.T", coverName: "album_ziont")
        let music7 = Music(title: "IDOL", singer: "방탄소년단", coverName: "album_bts")
        let music8 = Music(title: "시간이 들겠지 (Feat. Colde)", singer: "로꼬", coverName: "album_loco")
        let music9 = Music(title: "모든 날, 모든 순간", singer: "폴킴", coverName: "album_paul")
        let music10 = Music(title: "Way Back Home", singer: "숀(SHAUN)", coverName: "album_shaun")
        musicList = [music1, music2, music3, music4, music5, music6, music7, music8, music9, music10]
    }
}

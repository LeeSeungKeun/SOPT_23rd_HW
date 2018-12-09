//
//  WriteBoardVC.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import UIKit

class WriteBoardVC: UIViewController {
    @IBOutlet weak var writeTitleTF: UITextField!
    @IBOutlet weak var writeContentTextView: UITextView!
    @IBOutlet weak var writeImgView: UIImageView!
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTap()
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func completeAction(_ sender: Any) {
        guard writeTitleTF.text?.isEmpty != true else {return}
        guard writeContentTextView.text?.isEmpty != true else {return}
        
        BoardService.shared.uploadBoard(title: gsno(writeTitleTF.text!), contents: gsno(writeContentTextView.text!), image: writeImgView.image ?? UIImage()) {
            if (self.userDefault.string(forKey: "token") != nil) {
                self.simpleAlertwithHandler(title: "글을 작성하시겠습니까?", message: "") {
                    (okHandler) in
                    self.dismiss(animated: true, completion: nil)
                }
            } else {
                self.simpleAlert(title: "로그인을 해주세요", message: "")
            }
        }
    }
    
    
    // 텍스트필드나 텍스트 뷰의 edit 모드를 해제하기 위한, 즉, 키보드를 내리기 위한 탭 제스처와
    // 이미지 뷰를 탭하면 이미지를 추가할 수 있는 탭 제스처 설정
    func setupTap() {
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        self.view.addGestureRecognizer(viewTap)
        self.writeImgView.addGestureRecognizer(imageTap)
    }
    
    //뷰를 탭하면 edit 상태를 끝낸다
    @objc func viewTapped() {
        self.view.endEditing(true)
    }
    
    //이미지를 탭하면 이미지피커를 띄우는 메소드
    //코드를 천천히 읽어보시고 한번 이해해보세요!
    //영어 단어 뜻대로 의미를 담고 있으니 어렵지않게 이해하실겁니다.
    @objc func imageTapped() {
        let picker = UIImagePickerController()
        picker.delegate = self
        let actionSheet = UIAlertController(title: "Photo source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                picker.sourceType = .camera
                picker.allowsEditing = true
                picker.showsCameraControls = true
                self.present(picker, animated: true)
            } else {
                print("not available")
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(actionSheet, animated: true)
    }
    
}


//이미지 피커에 대한 여러 동작을 처리하는 delegate
extension WriteBoardVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //이미지를 선택하지 않고 피커 종료시에 실행되는 delegate 메소드
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //이미지 피커에서 이미지를 선택하였을 때 일어나는 이벤트를 작성하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImg = UIImage()
        
        if let possibleImg = info[.editedImage] as? UIImage {
            newImg = possibleImg
        }
        else if let possibleImg = info[.originalImage] as? UIImage {
            newImg = possibleImg
        }
        else {
            return
        }
        writeImgView.image = newImg
        dismiss(animated: true, completion: nil)
    }
}

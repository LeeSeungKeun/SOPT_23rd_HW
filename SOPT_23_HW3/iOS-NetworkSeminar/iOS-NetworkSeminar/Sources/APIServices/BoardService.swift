//
//  BoardService.swift
//  iOS-NetworkSeminar
//
//  Created by Leeseungsoo on 2018. 11. 20..
//  Copyright © 2018년 sopt. All rights reserved.
//

import Alamofire

struct BoardService: APIManager, Requestable {
    typealias NetworkData = ResponseArray<Board>
    static let shared = BoardService()
    let boardURL = url("/contents")
    let header: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    //모든 게시글 조회 api
    //게시글을 불러올 때 옵션에 대한 내용이 api명세서에 더 추가되어있습니다.
    //api 명세서를 보시고 한번 시도해보세요!
    func getBoardList(offset: Int? = 0, limit: Int? = 10, completion: @escaping ([Board]) -> Void) {
        let queryURL = boardURL + "?offset=\(offset ?? 0)&limit=\(limit ?? 10)"
        gettable(boardURL, body: nil, header: header) { (res) in
            switch res {
            case .success(let value):
                guard let boardList = value.data else
                {return}
                completion(boardList)
            case .error(let error):
                print(error)
            }
        }
    }
    
    //게시글 상세 조회 api
    func getBoardDetail(id: Int, completion: @escaping (Board) -> Void) {
//        let queryURL = boardURL + "/{\(id)}"
//        gettable(boardURL, body: nil, header: header) { (res) in
//
        
            
            
        }
    }
    
    
    //글 작성 api
    //이 api는 조금 다른방식의 request를 보냅니다. 한번 도전해봅시다!
    func uploadBoard(title: String, contents: String, image: UIImage, completion: @escaping () -> Void) {
        //코드 작성
//        let body = [
//            title: "title",
//            contents: "contents"
//            //image: "image"
//        ]
//        postable(boardURL, body: body, header: header) { res in
//            switch res {
//            case .success:
//                completion()
//            case .error(let error):
//                print(error)
//            }
//        }
//    }
    
    //게시글 좋아요 api
    func like() {
        //코드 작성
    }
    
    
}

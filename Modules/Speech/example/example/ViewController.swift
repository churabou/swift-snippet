//
//  ViewController.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/20.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//


//ああああテストテスト
//初めてのいちごがありおいしかった
//柿ピー顔食べました賞味期限が切れそうです



import UIKit

class ViewController: UIViewController {
    
    
    fileprivate func initializeView() {

        let b = Button()
        b.setUp(view)
        view.addSubview(b)
        b.onTap {
            
            let p = AudioRecognizer()
            guard let url = Bundle.main.url(forResource: "voice3", withExtension: "aac") else {
                fatalError("missin bundole ")
            }
            p.startRecognition(url: url, completion: { result in
                
                print("解析結果: \(result)")
            })
        }
     
    }

    override func viewDidLoad() {
    
        super.viewDidLoad()
        // 初回起動時のみ許可が必要
        AudioRecognizer.requestAuthorization()
        initializeView()
    }
}


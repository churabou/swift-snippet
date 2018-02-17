//
//  ViewController.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/17.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView()
        v.backgroundColor = .red
        v.frame.size = CGSize(width: 50, height: 50)
        v.center = view.center
        view.addSubview(v)
        
        
        
        
        
        view.layer.basic.add(.backgroundColor, { anim in
            return anim.from(UIColor.blue.cgColor).to(UIColor.orange.cgColor).duration(2).repeatCount(10)
        })
        
//        //中心から円が広がる
//        v.layer.basic.cornerRadius(key: "", animation: { anim in
//
//            anim.from(25).to(500).duration(0.7)
//            anim.fromValue = 25
//            anim.toValue = 500
//            anim.duration = 0.7
//            anim.repeatCount = 10
//            return anim
//        })
//
//        v.layer.basic.bounds(key: "", animation: { anim in
//            anim.fromValue = CGRect(x: 0, y: 0, width: 50, height: 50)
//            anim.toValue = CGRect(x: 0, y: 0, width: 1000, height: 1000)
//            anim.duration = 0.7
//            anim.repeatCount = 10
//            return anim
//        })
        
    }
}


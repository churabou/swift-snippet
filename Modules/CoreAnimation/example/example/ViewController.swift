//
//  ViewController.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/17.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    func hoge(closuer: (([Int])->Swift.Void)) {
        
        closuer([0,1,2,3])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView()
        v.backgroundColor = .red
        v.frame.size = CGSize(width: 50, height: 50)
        v.center = view.center
        view.addSubview(v)
        

        //中心から円が広がるアニメーション
        v.layer.basic(.cornerRadius, { anim in
            return anim
            .from(25)
            .to(500)
            .duration(0.7)
            .repeatCount(10)
        })
        
        v.layer.basic(.bounds, { anim in
            return anim
            .from(CGRect(x: 0, y: 0, width: 50, height: 50))
            .to(CGRect(x: 0, y: 0, width: 1000, height: 1000))
            .duration(0.7)
            .repeatCount(10)
        })
    }
}


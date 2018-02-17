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
        v.frame.size = CGSize(width: 200, height: 200)
        v.center = view.center
        view.addSubview(v)
        
        v.layer.basic.rotationZ(key: "", animation: { anim in
            anim.fromValue = 0
            anim.toValue = Double.pi * 2
            anim.duration = 5
            anim.repeatCount = 5
            return anim
        })
        
    }
}


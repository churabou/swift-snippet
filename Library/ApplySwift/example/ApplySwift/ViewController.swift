//
//  ViewController.swift
//  ApplySwift
//
//  Created by ちゅーたつ on 2018/03/04.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView()
        v.apply { $0
            .size(width: 200, height: 200)
            .origin(x: 100, y: 100)
            .clipsToBounds()
            .cornerRadius(100)
            .backgroudColor(.red)
        }
        
        let b = UIButton()
        b.apply { $0
            .origin(x: 50, y: 300)
            .size(width: 200, height: 60)
            .title("apply swift")
            .cornerRadius(30)
            .titleColor(.white)
            .backgroudColor(.orange)
        }
        
        view.addSubview(v)
        view.addSubview(b)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


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

        
        let layer = CALayer()
        layer.frame.origin = CGPoint(x: 100, y: 100)
        layer.frame.size = CGSize(width: 200, height: 200)
        layer.cornerRadius = 100
        layer.transform = CATransform3DMakeTranslation(0, 100, 0)
        layer.backgroundColor = UIColor.magenta.cgColor
        
        let anim1 = CABasicAnimation(.positionX).maker
        .from(0)
        .to(300)
        .duration(3)
        .fillModeForwards()
        .Animation()
        
        let anim2 = CABasicAnimation(.backgroundColor).maker
        .from(UIColor.red.cgColor)
        .to(UIColor.cyan.cgColor)
        .begin(3)
        .duration(1)
        .repeatCount(1)
        .Animation()
        
        let group = CAAnimationGroup().maker
        .anims([anim1, anim2])
        .duration(4)
        .repeatCount(10)
        .autoreverses(true)
        .Animation()
        
        layer.add(group, forKey: nil)
        view.layer.addSublayer(layer)
    }
}


class GDButton: UIButton {
    
    override func draw(_ rect: CGRect) {
        
        let v = CAGradientLayer()
        v.colors = [UIColor.blue.cgColor, UIColor.magenta.cgColor]
        v.startPoint = CGPoint(x: 0, y: 0.5)
        v.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
}


//```
//let v = CAGradientLayer()
//v.colors = [UIColor.blue.cgColor, UIColor.magenta.cgColor]
//v.startPoint = CGPoint(x: 0, y: 0.5)
//v.endPoint = CGPoint(x: 1.0, y: 0.5)
//```


//let colors: [UIColor] = [.red, .yellow, .green, .cyan, .magenta]
//
//for i in 0..<10 {
//
//    let v = CALayer()
//    let width: CGFloat = 150 + CGFloat(i) * 20
//    let height: CGFloat =  40
//    v.backgroundColor = colors[i%5].cgColor
//    v.cornerRadius = height/2
//    v.frame = CGRect(x: -height/2, y: height*CGFloat(i+1), width: width, height: height)
//    v.basic(.transform, { anim in
//        return anim
//            .from(CATransform3DMakeTranslation(-width, 0, 0))
//            .to(CATransform3DMakeTranslation(-height/2, 0, 0))
//            .duration(0.3)
//            .repeatCount(10)
//    })
//    view.layer.addSublayer(v)
//}


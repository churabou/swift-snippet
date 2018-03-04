//
//  ViewController.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/17.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit
//import Mat


struct Math {
    
    static var pi: CGFloat {
        return CGFloat(Double.pi)
    }
    
    static func sin(_ degrees: Double) -> Double {
        return __sinpi(degrees/180.0)
    }
    
    static func cos(_ degrees: Double) -> Double {
        return __cospi(degrees/180.0)
    }
}

class ViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let v = UIView()
        
        v.frame = view.frame
        v.backgroundColor = .red
        view.addSubview(v)
        
        
        UIView.animate(withDuration: 5, animations: {
            
//            v.transform = v.transform.scaledBy(x: 0.1, y: 0.3)
            v.transform = v.transform.inverted()
            
        })
        
        
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


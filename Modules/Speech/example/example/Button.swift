//
//  Button.swift
//  example
//
//  Created by ちゅーたつ on 2018/03/03.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


class Button: UIButton {
    
    func setUp(_ view: UIView) {
        
        view.addSubview(self)
        frame.size = CGSize(width: 100, height: 100)
        backgroundColor = .orange
        center = view.center
    }
    
    private var closure = {}
    
    @objc private func actionClosure() {
        closure()
    }
    
    func onTap(_ closure: @escaping ()->()) {
        self.closure = closure
        addTarget(self, action: #selector(actionClosure), for: .touchUpInside)
    }
}

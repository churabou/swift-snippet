//
//  Apply.swift
//  ApplySwift
//
//  Created by ちゅーたつ on 2018/03/04.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit

protocol ApplySwift {
    
//    associatedtype ApplyType
    
    //static func apply(_ closure: (Applicable<ApplyType>.Type)->Swift.Void) -> Self.Types
}

extension ApplySwift {

//    static func apply(_ closure: (Applicable<ApplyType>.Type)->Swift.Void) -> Self.Type {
//        closure(Applicable<Self>.self)
//        return self
//    }
    
    func apply(_ closure: (Applicable<Self>)->Applicable<Self>) {
        closure(Applicable(self)).escape()
    }

}

struct Applicable<T> {
    
    public var base: T
    
    init(_ base: T) {
        self.base = base
    }
    
    fileprivate func escape() {}
}


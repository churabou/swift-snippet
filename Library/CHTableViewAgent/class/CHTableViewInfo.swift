//
//  CHTableViewInfo.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/24.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit



class CHTableViewSectionInfo {
    
    func configure(_ closure: (CHSectionInfoMaker)->(CHSectionInfoMaker)) {
        closure(CHSectionInfoMaker(self)).escape()
    }

    func escape(_ obj :CHSectionInfoMaker) {}
    
    var numberOfRow: (()->(Int))?
    var cellForRowAt: ((IndexPath) -> UITableViewCell)?
    var heightForRowAt: ((IndexPath) -> CGFloat)?
    var didSelectRowAt: ((IndexPath) -> Swift.Void)?
    
}


class CHSectionInfoMaker {
    
    var item: CHTableViewSectionInfo
    
    init(_ item: CHTableViewSectionInfo) {
        self.item = item
    }
    
    func numberOfRow(_ closure: @escaping () -> Int) -> Self {
        item.numberOfRow = closure
        return self
    }
    
    func cellForRowAt(_ closure: @escaping (IndexPath) -> UITableViewCell) -> Self {
        
        item.cellForRowAt = closure
        return self
    }
    
    func heightForRowAt(_ closure: @escaping (IndexPath) -> CGFloat) -> Self {
        item.heightForRowAt = closure
        return self
    }
    
    func didSelectRowAt(_ closure: @escaping (IndexPath) -> Swift.Void) -> Self {
        item.didSelectRowAt = closure
        return self
    }
    
    fileprivate func escape() {}
}


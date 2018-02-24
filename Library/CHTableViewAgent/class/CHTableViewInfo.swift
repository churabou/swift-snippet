//
//  CHTableViewInfo.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/24.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit



class CHTableViewSectionInfo {
    
    var item = CHSectionInfoItem()
    
    
    func cellForRowAt(_ closure: @escaping (UITableView, IndexPath) -> UITableViewCell) -> Self {
    
        item.cellForRowAt = closure
        return self
    }
    var cellForRowAt: ((UITableView, IndexPath) -> UITableViewCell)?
    var heightForRowAt: ((UITableView, IndexPath) -> CGFloat)?

}

class CHSectionInfoItem {
    var cellForRowAt: ((UITableView, IndexPath) -> UITableViewCell)?
    var heightForRowAt: ((UITableView, IndexPath) -> CGFloat)?
}





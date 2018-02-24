//
//  CHTableViewAgentDelegate.swift
//  example
//
//  Created by ちゅーたつ on 2018/02/24.
//  Copyright © 2018年 ちゅーたつ. All rights reserved.
//

import UIKit


protocol CHTableViewAgentDelegate {
    
    func numberOfSection() -> Int
    func configureSection(_ tableView: UITableView, _ section: Int, _ info: CHTableViewSectionInfo)
}

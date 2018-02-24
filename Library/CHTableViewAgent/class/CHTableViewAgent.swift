//
//

import UIKit




// you should not set delegate and datasource, it no
class CHTableViewAgent: NSObject {
    
    var tableView: UITableView {
        return _tableView
    }
    
    fileprivate var _tableView = UITableView()
    fileprivate var infoArray: [CHTableViewSectionInfo] = []
    
    var delegate: CHTableViewAgentDelegate?
    
    
    var sectionNum: Int {
        return delegate!.numberOfSection()
    }
    
    
    func configureView(_ closure: (UITableView) -> Swift.Void) {
        
        closure(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        for _ in 0..<sectionNum {
            let info = CHTableViewSectionInfo()
            infoArray.append(info)
        }
        
        for i in 0..<sectionNum {
            //delegate?.configureSection(i, infoArray[i])
            delegate?.configureSection(tableView, i, infoArray[i])
        }
    }
}

extension CHTableViewAgent: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let height = infoArray[indexPath.section].heightForRowAt?(indexPath) {
            return height
        } else {
            return tableView.rowHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        infoArray[indexPath.section].didSelectRowAt?(indexPath)
    }
}

extension CHTableViewAgent: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let numberOfRow = infoArray[section].numberOfRow?() {
            return numberOfRow
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = infoArray[indexPath.section].cellForRowAt?(indexPath) {
            return cell
        }
        
        let cell = UITableViewCell()
        return cell
    }
    

}


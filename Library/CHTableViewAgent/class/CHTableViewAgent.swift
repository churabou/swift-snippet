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
            delegate?.configureSection(i, infoArray[i])
        }
    }
}

extension CHTableViewAgent: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let k = infoArray[indexPath.section].heightForRowAt?(tableView, indexPath) {
            return k
        } else {
            return 100
        }
    }
}

extension CHTableViewAgent: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNum
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = infoArray[indexPath.section].cellForRowAt?(tableView, indexPath) {
            return cell
        }
        
        let cell = UITableViewCell()
        return cell
    }
    

}


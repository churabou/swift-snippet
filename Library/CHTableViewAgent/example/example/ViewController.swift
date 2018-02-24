import UIKit

class ViewController: UIViewController {
    
    var agent = CHTableViewAgent()
    
    override func viewDidAppear(_ animated: Bool) {
        
        agent.delegate = self
        agent.configureView { tableView in
            tableView.backgroundColor = .green
            tableView.frame = view.frame
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            view.addSubview(tableView)
        }
        
    }
}


extension ViewController: CHTableViewAgentDelegate {
    
    func numberOfSection() -> Int {
        return 5
    }
    
    func configureSection(_ tableView: UITableView, _ section: Int, _ info: CHTableViewSectionInfo) {
        
        switch section {
            
        case 0:
            info.configure { $0
                .numberOfRow {
                    return 5
                }
                .cellForRowAt { indexPath in
                    let cell = UITableViewCell()
                    cell.textLabel?.text = "0 \(indexPath)"
                    return cell
                }
                .heightForRowAt { indexPath in
                    let k = indexPath.row % 3
                    return CGFloat(k*30)
                }
            }
            
        case 3:
            info.configure { $0
                .cellForRowAt { indexPath in
                    let cell = UITableViewCell()
                    cell.backgroundColor = .red
                    cell.textLabel?.text = "0 \(indexPath)"
                    return cell
                }
                .didSelectRowAt { IndexPath in
                    print("section 3 clicked \(IndexPath)")
                }
            }
        default:
            info.configure { $0
                .cellForRowAt { indexPath in
                    
                    let cell = UITableViewCell()
                    cell.textLabel?.text = "デフォルト載せる \(indexPath)"
                    return cell
                }
                .heightForRowAt { indexPath in
                    return 50
                }
            }
        }
    }
}

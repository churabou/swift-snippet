#### usage


```
    let agent = CHTableViewAgent()
    agent.delegate = self
    agent.configureView { tableView in
    tableView.backgroundColor = .white
    tableView.frame = view.frame
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    view.addSubview(tableView)
}
```


```


extension ViewController: CHTableViewAgentDelegate {

    func numberOfSection() -> Int {
        return 3
    }


func configureSection(_ section: Int, _ info: CHTableViewSectionInfo) {

    switch section {
    case 0:
        info
        .cellForRowAt = { talbeView, indexPath in
            let cell = UITableViewCell()
            cell.textLabel?.text = "0 \(indexPath)"
            return cell
        }
        .heightForRowAt = { tableView, indexPath in
            return 50
        }
    
    case 1:
        info
        .cellForRowAt = { talbeView, indexPath in
            let cell = UITableViewCell()
            cell.textLabel?.text = "0 \(indexPath)"
            return cell
        }
        .heightForRowAt = { tableView, indexPath in
            return 100
        }
        .headerInSection =  { tableView, indexPath in
            tableView.deque
        }
    defalt:
        return
    }
}


}


```

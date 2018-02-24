in case you use UITableView that has more than 3 section, CHTableViewAgent helps you!! you can configure cellForRow,cellHeight and other delegate or datasource method for each section in configureSection(_ section: Int, _ info: CHTableViewSectionInfo method with chanable colosure insted of UITableViewDelegate and TableViewDataSoursce which would be massive

#### usage
```
    let agent = CHTableViewAgent()
    agent.delegate = self
    agent.configureView { tableView in
    tableView.backgroundColor = .white
    tableView.frame = view.frame
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    view.addSubview(tableView)
``

```
extension ViewController: CHTableViewAgentDelegate {

    func numberOfSection() -> Int {
        return 3
    }



    func configureSection(_ tableView: UITableView, _ indexPath: IndexPath, _ info: CHTableViewSectionInfo) {

           switch indexPath.section {
           case 0:
               info
           .cellForRowAt {
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
               cell.textLabel?.text = "0 \(indexPath)"
               return cell
           }
           .heightForRowAt {
               return 50
           }
       case 1:
           info
           .cellForRowAt {
               let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
               cell.textLabel?.text = "0 \(indexPath)"
               return cell
           }
           .heightForRowAt {
               return 100
           }
       case 2:
           info
           .cellForRowAt {
               if indexPath.row == 0 {
                   let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                   cell.textLabel?.text = "0 \(indexPath)"
                   return cell
               } else {
                   return UITableViewCell()
               }
           }
           .heightForRowAt {
               return 80
           }
           .sectionHeader {
               return UIView()
           }
   }    

    func defaultAction(_ tableView: UITableView, _ indexPath: IndexPath, _ info: CHTableViewSectionInfo) {
       info.didSelectRow {
           print(indexPath)
       }
    }
}
```



import UIKit

final class ViewController: UIViewController, UITableViewDelegate {
    // MARK: - variables parametrs
    
    let restaurantNames = ["dadsasd","dasdada","dadsasd","dasdada","dadsasd","dasdada",
                           "dadsasd","dasdada","dadsasd","dasdada","dadsasd","dasdada"]
    
    private lazy var tableList: UITableView = {
        let table = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        return table
    }()
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Title For Header InSection"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "Title For Footer InSection"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
    }
    
    private func setupView(){
        view.backgroundColor = .red
        [tableList].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
        
        tableList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        tableList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        tableList.topAnchor.constraint(equalTo: view.topAnchor),
        tableList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}


// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cell"
        return cell
    }

}

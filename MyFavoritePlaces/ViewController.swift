
import UIKit

final class ViewController: UIViewController {
    // MARK: - variables parametrs

    
    let places = Place.getPlaces()
    
    private lazy var launchView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = #colorLiteral(red: 0.56266886, green: 0.8747029901, blue: 0.6645568013, alpha: 1)
        view.image = UIImage(named: "LaunchScreenImg")
        return view
    }()
    
    private lazy var tabBar: UITabBar = {
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        return tabBar
    }()
    
    private lazy var tableList: UITableView = {
        let table = UITableView.init(frame: .zero, style: UITableView.Style.plain)
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
        view.addSubview(launchView)
        setupView()
        setupConstraint()
    }
    
    private func setupView(){
        [tableList].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraint(){
        NSLayoutConstraint.activate([
            launchView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            launchView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
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
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellIdentifier")
        
        cell.textLabel?.text = places[indexPath.row].name
        cell.detailTextLabel?.text = places[indexPath.row].location
        cell.imageView?.image = UIImage(named: places[indexPath.row].image)
        
        cell.imageView?.layer.cornerRadius = cell.frame.size.height / 1 // почему cornerRadius != 0,5 height
        cell.imageView?.clipsToBounds = true // обрезка image
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

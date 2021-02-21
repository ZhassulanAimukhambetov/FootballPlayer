import UIKit

class MainViewController: UITableViewController {
    
    var presenter: MainPresenterOutput?
    private var dataSourse: [MatchDataSourse]? {
        didSet {
            DispatchQueue.onMain { self.tableView.reloadData() }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.loadData()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.contentInset.top = -44
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .darkGray
        tableView.backgroundView = BackgroundImageView()
        tableView.register(VideoCell.self, forCellReuseIdentifier: VideoCell.ID)
        tableView.register(HeaderCell.self, forCellReuseIdentifier: HeaderCell.ID)
    }
}

extension MainViewController: MainPresenterInput {
    func configure(with data: [MatchDataSourse]) {
        dataSourse = data
    }
    
    func showError(with message: String) {
        showAlert(with: message)
    }
}

extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSourse?[indexPath.row] {
        case .header(let match):
            let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.ID, for: indexPath) as! HeaderCell
            cell.configure(with: match)
            return cell
        case .video(let video):
            let cell = tableView.dequeueReusableCell(withIdentifier: VideoCell.ID, for: indexPath) as! VideoCell
            cell.configure(with: video)
            return cell
        case .none:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if case let .video(video) = dataSourse?[indexPath.row] {
            presenter?.playVideo(with: video.url)
        }
    }
}

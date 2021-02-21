import UIKit

class HeaderCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 40/255, green: 34/255, blue: 34/255, alpha: 0.8)
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var tournamentNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: .tournamentName)
        return label
    }()
    
    
    private lazy var firstTeamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: .teamName)
        return label
    }()
    
    private lazy var secondTeamNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: .teamName)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: .date)
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.configure(with: .score)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
    
    func configure(with matchInfo: Match) {
        tournamentNameLabel.text = matchInfo.tournament.nameRus
        firstTeamNameLabel.text = matchInfo.firstTeam.nameRus
        secondTeamNameLabel.text = matchInfo.secondTeam.nameRus
        dateLabel.text = "\(matchInfo.date.format())"
        scoreLabel.text = "\(matchInfo.firstTeam.score) - \(matchInfo.secondTeam.score)"
    }
    
    private func setupConstraint() {
        
        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        containerView.addSubview(tournamentNameLabel)
        tournamentNameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        tournamentNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        
        containerView.addSubview(scoreLabel)
        scoreLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        scoreLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        containerView.addSubview(firstTeamNameLabel)
        firstTeamNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        firstTeamNameLabel.trailingAnchor.constraint(equalTo: scoreLabel.leadingAnchor, constant: -5).isActive = true
        firstTeamNameLabel.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor).isActive = true
        
        containerView.addSubview(secondTeamNameLabel)
        secondTeamNameLabel.leadingAnchor.constraint(equalTo: scoreLabel.trailingAnchor, constant: 5).isActive = true
        secondTeamNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        secondTeamNameLabel.centerYAnchor.constraint(equalTo: scoreLabel.centerYAnchor).isActive = true

        containerView.addSubview(dateLabel)
        dateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
        dateLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

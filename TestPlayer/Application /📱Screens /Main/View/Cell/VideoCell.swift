import UIKit

final class VideoCell: UITableViewCell {
        
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configure(with: .play)
        button.alpha = 0.8
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }
    
    func configure(with video: Video) {
        playButton.setTitle("Смотерть \(video.period) тайм", for: .normal)
    }
    
    private func setupConstraint() {
        addSubview(playButton)
        playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        playButton.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



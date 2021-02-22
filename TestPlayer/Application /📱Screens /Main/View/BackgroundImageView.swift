import UIKit

final class BackgroundImageView: UIImageView {
    lazy private var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.alpha = 0.8
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    private func setup() {
        addSubview(shadowView)
        
        shadowView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        shadowView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        contentMode = .scaleAspectFill
        image = UIImage(named: "ic_background_tableView")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

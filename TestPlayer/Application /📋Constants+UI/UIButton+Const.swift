import UIKit

enum BaseButtonType {
    case play
    
    var backgroundColor: UIColor {
        switch self {
        case .play: return .darkGray
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .play: return .white
        }
    }
    
    var titleFont: UIFont {
        switch self {
        case .play: return .boldSystemFont(ofSize: 18)
        }
    }
    
    var cornerRaduis: CGFloat {
        switch self {
        case .play: return 12.0
        }
    }
}


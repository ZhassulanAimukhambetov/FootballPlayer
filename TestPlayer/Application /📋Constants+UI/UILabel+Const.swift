import UIKit

enum BaseLabelType {
    case teamName
    case tournamentName
    case date
    case score
    
    var backgroundColor: UIColor {
        switch self {
        case .teamName, .tournamentName, .date, .score: return .clear
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .teamName, .tournamentName, .date, .score: return .white
        }
    }
    
    var titleFont: UIFont {
        switch self {
        case .teamName: return .boldSystemFont(ofSize: 18)
        case .tournamentName: return .systemFont(ofSize: 18)
        case .date: return .systemFont(ofSize: 14)
        case .score: return .boldSystemFont(ofSize: 36)
        }
    }
}

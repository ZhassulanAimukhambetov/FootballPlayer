import Foundation

enum Module {
    case main
    case videoPlayer(url: String)
}

extension Module {
    var assembly: Assembly {
        switch self {
        case .main: return MainAssembly()
        case .videoPlayer(let url): return VideoPlayerAssembley(url: url)
        }
    }
}

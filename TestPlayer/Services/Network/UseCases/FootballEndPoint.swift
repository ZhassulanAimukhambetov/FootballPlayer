import Foundation

enum FootballEndPint {
    case getMatchInfo(id: Int, sportID: Int)
    case getMatchVideos(id: Int, sportID: Int)
}

extension FootballEndPint: NetworkRouter {
    
    var baseURL: String {
        return "https://api.instat.tv/test"
    }
    
    var path: String {
        switch self {
        case .getMatchInfo: return "/data"
        case .getMatchVideos: return "/video-urls"
        }
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var body: [String : Any?] {
        switch self {
        case .getMatchInfo(let id, let sportID):
            return ["proc": "get_match_info",
                    "params": ["_p_sport": sportID,
                               "_p_match_id": id]]
        case .getMatchVideos(let id, let sportID):
            return ["match_id": id,
                    "sport_id": sportID]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMatchInfo: return .post
        case .getMatchVideos: return .post
        }
    }
}

import Foundation

struct Match: Codable {
    let tournament: Tournament
    var date: String
    let firstTeam: Team
    let secondTeam: Team
    let hasVideo: Bool
    let live: Bool
    let storage: Bool
    let sub: Bool
    let access: Bool
    
    enum CodingKeys: String, CodingKey {
        case tournament, date
        case firstTeam = "team1"
        case secondTeam = "team2"
        case hasVideo = "has_video"
        case live, storage, sub, access
    }
}

extension Match {
    struct Tournament: Codable {
        let id: Int
        let nameEng: String
        let nameRus: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case nameEng = "name_eng"
            case nameRus = "name_rus"
        }
    }
}

extension Match {
    struct Team: Codable {
        let id: Int
        let nameEng: String
        let nameRus: String
        let score: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case nameEng = "name_eng"
            case nameRus = "name_rus"
            case score
        }
    }
}

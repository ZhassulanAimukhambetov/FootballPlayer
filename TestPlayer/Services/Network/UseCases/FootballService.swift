import Foundation

protocol FootballUseCase {
    func getMatchInfoAndVideos(id: Int, sportID: Int, _ completion: @escaping (Result<(Match, [Video]), NetworkError>) -> Void)
    func getMatchInfo(id: Int, sportID: Int, _ completion: @escaping (Result<Match, NetworkError>) -> Void)
    func getVideos(id: Int, sportID: Int, _ completion: @escaping (Result<[Video], NetworkError>) -> Void)
}

final class FootballUseCaseImpl: FootballUseCase {
    
    func getMatchInfo(id: Int, sportID: Int, _ completion: @escaping (Result<Match, NetworkError>) -> Void) {
        NetworkService.shared.call(FootballEndPint.getMatchInfo(id: id, sportID: sportID)) {
            completion($0)
        }
    }
    
    func getVideos(id: Int, sportID: Int, _ completion: @escaping (Result<[Video], NetworkError>) -> Void) {
        NetworkService.shared.call(FootballEndPint.getMatchVideos(id: id, sportID: sportID)) {
            completion($0)
        }
    }
    
    func getMatchInfoAndVideos(id: Int, sportID: Int, _ completion: @escaping (Result<(Match, [Video]), NetworkError>) -> Void) {
        typealias MatchData = (matches: [Match], videos: [Video], error: NetworkError?)
        let group = DispatchGroup()
        var data: MatchData = ([],[], nil)
        group.enter()
        getMatchInfo(id: id, sportID: sportID) { result in
            switch result {
            case .success(let match):
                data.matches.append(match)
                group.leave()
            case .failure(let error):
                data.error = error
                group.leave()
            }
        }
        
        group.enter()
        getVideos(id: id, sportID: sportID) { result in
            switch result {
            case .success(let videos):
                data.videos +=  videos
                group.leave()
            case .failure(let error):
                data.error = error
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            if let error = data.error {
                completion(.failure(error))
                return
            }
            completion(.success((data.matches[0], data.videos)))
        }
    }
}

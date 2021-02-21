import UIKit

protocol MainPresenterOutput {
    func loadData()
    func playVideo(with url: String)
}

protocol MainPresenterInput: class {
    func configure(with data: [MatchDataSourse])
    func showError(with message: String)
}

final class MainPresenter {
    
    weak var view: MainPresenterInput?
    private var coordinator: BaseCoordinator?
    private var footballUseCase: FootballUseCase
    
    private let sportID = 1
    private let id = 1724836
    private var videos: [Video] = []
    
    init(coordinator: BaseCoordinator?, footballUseCase: FootballUseCase) {
        self.coordinator = coordinator
        self.footballUseCase = footballUseCase
    }
    
    internal func mapDataSourse(data: (Match, [Video])) -> [MatchDataSourse] {
        var dataSourse = [MatchDataSourse]()
        dataSourse.append(.header(match: data.0))
        data.1.forEach { dataSourse.append(.video(video: $0)) }
        return dataSourse
    }
}
 
extension MainPresenter: MainPresenterOutput {
    func loadData() {
        footballUseCase.getMatchInfoAndVideos(id: id, sportID: sportID) { [self] result in
            switch result {
            case .success(let data):
                let dataSourse = mapDataSourse(data: data)
                self.view?.configure(with: dataSourse)
            case .failure(let error):
                self.view?.showError(with: error.rawValue)
            }
        }
    }
    
    func playVideo(with url: String) {
        coordinator?.present(module: .videoPlayer(url: url))
    }
}

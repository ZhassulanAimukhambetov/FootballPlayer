import UIKit

protocol VideoPlayerPresenterOutput {
    func play()
}

protocol VideoPlayerPresenterInput: class {
    func configure(with url: URL)
    func showError(with message: String)
}

final class VideoPlayerPresenter: VideoPlayerPresenterOutput {
    weak var view: VideoPlayerPresenterInput?
    private var coordinator: BaseCoordinator?
    private var videoURL: String
    
    init(coordinator: BaseCoordinator?, videoURL: String) {
        self.coordinator = coordinator
        self.videoURL = videoURL
    }
    
    func play() {
        guard let url = URL(string: videoURL) else {
            view?.showError(with: "VideoURL Error")
            return
        }
        view?.configure(with: url)
    }
}

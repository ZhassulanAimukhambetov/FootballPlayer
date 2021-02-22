import UIKit

final class VideoPlayerAssembley: Assembly {

    private let url: String
    
    init(url: String) {
        self.url = url
    }
    
    func createAssembly(coordinator: BaseCoordinator) -> UIViewController {
        let view = VideoPlayerViewController()
        let presenter = VideoPlayerPresenter(coordinator: coordinator, videoURL: url)
        view.presenter = presenter
        presenter.view = view
        return view
    }
}

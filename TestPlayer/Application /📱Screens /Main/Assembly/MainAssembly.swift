import UIKit

class MainAssembly: Assembly {
    func createAssembly(coordinator: BaseCoordinator) -> UIViewController {
        let footballUseCase: FootballUseCase = AppBuilder.footballUseCase()
        let view = MainViewController()
        let presenter = MainPresenter(coordinator: coordinator, footballUseCase: footballUseCase)
        view.presenter = presenter
        presenter.view = view
        return view
    }
}

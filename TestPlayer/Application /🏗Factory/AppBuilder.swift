import UIKit

protocol Assembly {
    func createAssembly(coordinator: BaseCoordinator) -> UIViewController
}

protocol Builder: class{
    static func create(module: Module, with coordinator: BaseCoordinator) -> UIViewController
    static func footballUseCase() -> FootballUseCase
    static func appCoordinator() -> BaseCoordinator
}

final class AppBuilder: Builder {

    private static let footballService: FootballUseCase = FootballUseCaseImpl()
    private let navigationController: UINavigationController = UINavigationController()
    private static let coordinator: BaseCoordinator = AppCoordinator()

    static func footballUseCase() -> FootballUseCase {
        return footballService
    }
    
    static func appCoordinator() -> BaseCoordinator {
        return coordinator
    }
    
    static func create(module: Module, with coordinator: BaseCoordinator) -> UIViewController {
        return module.assembly.createAssembly(coordinator: coordinator)
    }
}

import UIKit

protocol BaseCoordinator: class {
    var navigationController: UINavigationController { get set }
    var builder: Builder? { get set }
    func start(with window: inout UIWindow?)
    func push(module: Module)
    func pop()
    func popToRoot()
    func present(module: Module)
}

extension BaseCoordinator {
    func push(module: Module) {
        let vc = AppBuilder.create(module: module, with: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func present(module: Module) {
        let vc = AppBuilder.create(module: module, with: self)
        navigationController.present(vc, animated: true, completion: nil)
    }
}

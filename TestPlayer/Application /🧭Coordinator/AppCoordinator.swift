import UIKit

final class AppCoordinator: BaseCoordinator {    
    
    var navigationController: UINavigationController
    weak var builder: Builder?
    
    init() {
        self.navigationController = UINavigationController()
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    func start(with window: inout UIWindow?) {
        let vc = AppBuilder.create(module: .main, with: self)
        navigationController.viewControllers = [vc]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

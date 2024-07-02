
import UIKit
import Utils
import Registration

public class RegistrationCoordinator: Coordinator {
    // MARK: - Properties
    
    public var navigationController: UINavigationController
    
    // MARK: - init
    
    public init(navigationController: UINavigationController = .init()) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    public func eventOccurred(with type: NavigationEvent) {
        
    }
    
    public func start() {
        var vc: UIViewController {
            if CacheService.shared.hasShownOpening {
                return OpeningViewController(
                    viewModel: .init(
                        coordinator: self
                    )
                )
            }
            return RegistrationViewController(
                viewModel: .init(
                    coordinator: self
                )
            )
        }
        navigationController.setViewControllers([vc], animated: false)
    }
}

public extension RegistrationCoordinator {
    func setTheOpeningWasShown() {
        CacheService.shared.hasShownOpening = true
    }
    
    func setTheUserIsRegistered(with token: String) {
        CacheService.shared.isLoggedIn = true
        CacheService.shared.token = token
    }
}

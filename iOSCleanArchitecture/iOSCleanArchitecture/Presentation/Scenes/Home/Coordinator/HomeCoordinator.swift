//
//  HomeCoordinator.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

protocol HomeCoordinator {
    func start()
}

final class DefaultHomeCoordinator {
    private let navigationController: UINavigationController
    private let externalDependencies: HomeExternalDependenciesResolver
    private lazy var dependencies: DefaultHomeDependenciesResolver = {
        DefaultHomeDependenciesResolver(externalDependencies: externalDependencies, coordinator: self)
    }()
    
    init(externalDependencies: HomeExternalDependenciesResolver, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.externalDependencies = externalDependencies
    }
}

extension DefaultHomeCoordinator: HomeCoordinator {
    func start() {
        guard let window = AppDependencies.shared.window else { return }
        navigationController.setViewControllers([dependencies.resolve()], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

private extension DefaultHomeCoordinator {
    struct DefaultHomeDependenciesResolver: HomeDependenciesResolver {
        let externalDependencies: HomeExternalDependenciesResolver
        let coordinator: HomeCoordinator
        
        var external: HomeExternalDependenciesResolver {
            externalDependencies
        }
        
        func resolve() -> HomeCoordinator {
            coordinator
        }
    }
}

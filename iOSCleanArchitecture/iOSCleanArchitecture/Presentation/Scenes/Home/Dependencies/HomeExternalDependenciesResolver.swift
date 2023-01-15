//
//  HomeExternalDependenciesResolver.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

protocol HomeExternalDependenciesResolver: CommonExternalDependenciesResolver {
    func resolve() -> UINavigationController
    func resolveAppDependencies() -> AppDependencies
    func resolveHomeCoordinator() -> HomeCoordinator
}

extension HomeExternalDependenciesResolver {
    func resolveHomeCoordinator() -> HomeCoordinator {
        DefaultHomeCoordinator(externalDependencies: self, navigationController: resolve())
    }
}

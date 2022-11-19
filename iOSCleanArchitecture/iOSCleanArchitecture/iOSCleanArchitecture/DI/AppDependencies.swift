//
//  AppDependencies.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 18/11/22.
//

import UIKit

final class AppDependencies {
    func resolve() -> UINavigationController {
        UINavigationController()
    }
}

extension AppDependencies: HomeExternalDependenciesResolver {}

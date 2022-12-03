//
//  AppDependencies.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

final class AppDependencies {
    static let shared = AppDependencies()
    
    private let navigationController = UINavigationController()
    var window: UIWindow?
    
    private init() {}
    
    func resolve() -> UINavigationController {
        navigationController
    }
}

extension AppDependencies: HomeExternalDependenciesResolver {}

//
//  AppDependencies.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

final class AppDependencies {
    private let navigationController = UINavigationController()
    private var window: UIWindow?
    
    func setWindow(_ window: UIWindow) {
        self.window = window
    }
    
    func getWindow() -> UIWindow? {
        window
    }
    
    func resolve() -> UINavigationController {
        navigationController
    }
    
    func resolveAppDependencies() -> AppDependencies {
        self
    }
    
    func resolveAPIService() -> APIService {
        DefaultAPIService()
    }
}

extension AppDependencies: HomeExternalDependenciesResolver {}

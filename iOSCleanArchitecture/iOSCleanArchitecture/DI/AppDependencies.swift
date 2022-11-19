//
//  AppDependencies.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

final class AppDependencies {
    static let shared = AppDependencies()
    
    var window: UIWindow?
    
    private init() {}
    
    func resolve() -> UINavigationController {
        UINavigationController()
    }
}

extension AppDependencies: HomeExternalDependenciesResolver {}

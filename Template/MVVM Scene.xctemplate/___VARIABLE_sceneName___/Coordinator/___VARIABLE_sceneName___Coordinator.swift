//
//  ___FILEBASENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

protocol ___VARIABLE_sceneName___Coordinator {
    func start()
}

final class Default___VARIABLE_sceneName___Coordinator {
    private let navigationController: UINavigationController
    private let externalDependencies: ___VARIABLE_sceneName___ExternalDependenciesResolver
    private lazy var dependencies: Default___VARIABLE_sceneName___DependenciesResolver = {
        Default___VARIABLE_sceneName___DependenciesResolver(externalDependencies: externalDependencies, coordinator: self)
    }()
    
    init(externalDependencies: ___VARIABLE_sceneName___ExternalDependenciesResolver, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.externalDependencies = externalDependencies
    }
}

extension Default___VARIABLE_sceneName___Coordinator: ___VARIABLE_sceneName___Coordinator {
    func start() {
        // Start scene
    }
}

private extension Default___VARIABLE_sceneName___Coordinator {
    struct Default___VARIABLE_sceneName___DependenciesResolver: ___VARIABLE_sceneName___DependenciesResolver {
        let externalDependencies: ___VARIABLE_sceneName___ExternalDependenciesResolver
        let coordinator: ___VARIABLE_sceneName___Coordinator
        
        var external: ___VARIABLE_sceneName___ExternalDependenciesResolver {
            externalDependencies
        }
        
        func resolve() -> ___VARIABLE_sceneName___Coordinator {
            coordinator
        }
    }
}

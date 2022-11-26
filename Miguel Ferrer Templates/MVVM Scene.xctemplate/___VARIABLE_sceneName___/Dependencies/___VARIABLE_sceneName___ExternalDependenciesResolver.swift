//
//  ___FILEBASENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

protocol ___VARIABLE_sceneName___ExternalDependenciesResolver {
    func resolve() -> UINavigationController
    func resolve___VARIABLE_sceneName___Coordinator() -> ___VARIABLE_sceneName___Coordinator
}

extension ___VARIABLE_sceneName___ExternalDependenciesResolver {
    func resolve___VARIABLE_sceneName___Coordinator() -> ___VARIABLE_sceneName___Coordinator {
        Default___VARIABLE_sceneName___Coordinator(externalDependencies: self, navigationController: resolve())
    }
}

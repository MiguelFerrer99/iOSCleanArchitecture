//
//  ___FILEBASENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

protocol ___VARIABLE_sceneName___DependenciesResolver {
    var external: ___VARIABLE_sceneName___ExternalDependenciesResolver { get }
    func resolve() -> ___VARIABLE_sceneName___Coordinator
    func resolve() -> ___VARIABLE_sceneName___ViewController
    func resolve() -> ___VARIABLE_sceneName___ViewModel
}

extension ___VARIABLE_sceneName___DependenciesResolver {
    func resolve() -> ___VARIABLE_sceneName___ViewController {
        ___VARIABLE_sceneName___ViewController(dependencies: self)
    }
    
    func resolve() -> ___VARIABLE_sceneName___ViewModel {
        ___VARIABLE_sceneName___ViewModel(dependencies: self)
    }
}

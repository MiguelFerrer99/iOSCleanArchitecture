//
//  ___FILEBASENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import Combine

enum ___VARIABLE_sceneName___ViewModelState {
    case idle
}

final class ___VARIABLE_sceneName___ViewModel {
    private let dependencies: ___VARIABLE_sceneName___DependenciesResolver
    private var subscriptions: Set<AnyCancellable> = []
    private let stateSubject = CurrentValueSubject<___VARIABLE_sceneName___ViewModelState, Never>(.idle)
    var state: AnyPublisher<___VARIABLE_sceneName___ViewModelState, Never>

    init(dependencies: ___VARIABLE_sceneName___DependenciesResolver) {
        self.dependencies = dependencies
        state = stateSubject.eraseToAnyPublisher()
    }
    
    func viewDidLoad() {
        // Execute UseCases
    }
}

private extension ___VARIABLE_sceneName___ViewModel {
    var coordinator: ___VARIABLE_sceneName___Coordinator {
        dependencies.resolve()
    }
}

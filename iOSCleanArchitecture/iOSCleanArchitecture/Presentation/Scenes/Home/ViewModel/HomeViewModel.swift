//
//  HomeViewModel.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Combine
import Foundation

enum HomeViewModelState {
    case idle
}

final class HomeViewModel {
    private let dependencies: HomeDependenciesResolver
    private var subscriptions: Set<AnyCancellable> = []
    private let stateSubject = CurrentValueSubject<HomeViewModelState, Never>(.idle)
    var state: AnyPublisher<HomeViewModelState, Never>

    init(dependencies: HomeDependenciesResolver) {
        self.dependencies = dependencies
        state = stateSubject.eraseToAnyPublisher()
    }
    
    func viewDidLoad() {
        getInfo()
    }
}

private extension HomeViewModel {
    var coordinator: HomeCoordinator {
        dependencies.resolve()
    }
    
    func sendStateSubject(_ stateSubject: HomeViewModelState) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.stateSubject.send(stateSubject)
        }
    }
    
    func getInfo() {
        Task {
            // guard let info = try? await self.homeUseCase.getInfo() else { return }
            sendStateSubject(.idle)
        }
    }
    
}

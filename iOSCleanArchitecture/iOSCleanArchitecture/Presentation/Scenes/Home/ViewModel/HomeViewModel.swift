//
//  HomeViewModel.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Combine

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
    
    func getInfo() {
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            // let info = try? await self.homeUseCase.getInfo()
            self.stateSubject.send(.idle)
        }
    }
}

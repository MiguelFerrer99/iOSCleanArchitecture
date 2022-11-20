//
//  HomeDependenciesResolver.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

protocol HomeDependenciesResolver {
    var external: HomeExternalDependenciesResolver { get }
    func resolve() -> HomeCoordinator
    func resolve() -> HomeViewController
    func resolve() -> HomeViewModel
    func resolve() -> HomeRepository
    func resolve() -> HomeUseCase
}

extension HomeDependenciesResolver {
    func resolve() -> HomeViewController {
        HomeViewController(dependencies: self)
    }
    
    func resolve() -> HomeViewModel {
        HomeViewModel(dependencies: self)
    }
    
    func resolve() -> HomeRepository {
        DefaultHomeRepository(dependencies: self)
    }
    
    func resolve() -> HomeUseCase {
        DefaultHomeUseCase(dependencies: self)
    }
}

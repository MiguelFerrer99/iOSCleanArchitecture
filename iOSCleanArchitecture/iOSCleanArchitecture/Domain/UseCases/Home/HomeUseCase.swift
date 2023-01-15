//
//  HomeUseCase.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

protocol HomeUseCase {}

final class DefaultHomeUseCase {
    private let repository: HomeRepository

    init(dependencies: HomeDependenciesResolver) {
        self.repository = dependencies.resolve()
    }
}

extension DefaultHomeUseCase: HomeUseCase {}

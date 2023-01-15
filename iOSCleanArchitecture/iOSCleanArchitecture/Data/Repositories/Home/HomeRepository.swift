//
//  HomeRepository.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

protocol HomeRepository {}

final class DefaultHomeRepository {
    private let dependencies: HomeExternalDependenciesResolver
    private let apiService: APIService
    
    init(dependencies: HomeExternalDependenciesResolver) {
        self.dependencies = dependencies
        self.apiService = dependencies.resolveAPIService()
    }
}

extension DefaultHomeRepository: HomeRepository {}

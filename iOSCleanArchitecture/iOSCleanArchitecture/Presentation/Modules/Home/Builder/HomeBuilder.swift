//
//  HomeBuilder.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class HomeBuilder {
    func build() -> HomeViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        let viewModel = HomeViewModel(router: router)
        viewController.viewModel = viewModel
        return viewController
    }
}

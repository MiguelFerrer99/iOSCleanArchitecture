//
//  HomeRouter.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class HomeRouter {
    weak var viewController: HomeViewController?

    init(viewController: HomeViewController?) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouterProtocol {}

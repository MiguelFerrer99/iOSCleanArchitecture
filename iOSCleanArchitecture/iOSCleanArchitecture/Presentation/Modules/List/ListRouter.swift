//
//  HomeRouter.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import UIKit

final class ListRouter {
    weak var viewController: ListViewController?

    init(viewController: ListViewController?) {
        self.viewController = viewController
    }
}

extension ListRouter: ListRouterProtocol {
}


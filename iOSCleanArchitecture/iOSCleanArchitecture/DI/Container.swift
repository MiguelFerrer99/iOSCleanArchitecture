//
//  Container.swift
//  clean
//
//  Created by Fernando Salom Carratala on 7/11/22.
//

import UIKit

final class Container {
    weak var window: UIWindow?
    static let shared = Container()
}

extension Container {
    func home() {
        DispatchQueue.main.async {
            self.window?.rootViewController = UINavigationController(rootViewController: HomeBuilder().build())
            self.window?.makeKeyAndVisible()
        }
    }
}

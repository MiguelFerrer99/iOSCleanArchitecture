//
//  BuilderProtocol.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

public protocol BuilderProtocol {
    func build() -> BaseViewController
}

public extension BuilderProtocol {
    func build() -> BaseViewController { BaseViewController() }
}

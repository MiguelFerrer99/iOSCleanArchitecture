//
//  BuilderProtocol.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 17/11/22.
//

protocol BuilderProtocol {
    func build() -> BaseViewController
}

extension BuilderProtocol {
    func build() -> BaseViewController { BaseViewController() }
}

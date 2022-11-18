//
//  HomeProtocols.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 17/11/22.
//

import Foundation

protocol HomeBuilderProtocol: BuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()
}

protocol HomeRouterProtocol {}

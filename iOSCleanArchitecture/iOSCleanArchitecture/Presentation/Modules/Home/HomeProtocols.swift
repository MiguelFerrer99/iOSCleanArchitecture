//
//  HomeProtocols.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

protocol HomeBuilderProtocol: BuilderProtocol {
    func build() -> HomeViewController
}

protocol HomeRouterProtocol {
    
}

protocol HomeViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()
}

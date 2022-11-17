//
//  HomeProtocols.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import Foundation

protocol ListBuilderProtocol: BuilderProtocol {
    func build() -> ListViewController
}

protocol ListRouterProtocol {
    
}

protocol ListViewModelProtocol: ViewModelProtocol {
    func viewDidLoad()
    func viewDidAppear()
    func viewDidDisappear()

    func loadMoreCharacter(currentItem: Int)
    func search(this name: String)
    var characters: [CharacterDTO] { get set }
    var hasNextPage: Bool { get set }
    var currentSearch: String { get set }
    var currentStatus: ListViewModel.Status { get set }
    var listCharactersUpdated: (() -> Void)? { get set }
    var errorHasOcurred: ((Error) -> Void)? { get set }
}

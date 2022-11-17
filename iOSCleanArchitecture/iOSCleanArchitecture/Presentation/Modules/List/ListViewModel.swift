//
//  HomeViewModel.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

final class ListViewModel: ListViewModelProtocol {
    let router: ListRouterProtocol
    var characterUseCase: CharacterUseCaseProtocol

    enum Status {
        case searching
        case listing
    }

    var currentSearch: String = "" {
        willSet {
            if newValue == currentSearch { return }
            characters = []
            hasNextPage = true
            page = 1
            currentStatus = currentSearch.isEmpty ? .listing : .searching
        }
    }
    var currentStatus: Status = .listing

    var characters = [CharacterDTO]() {
        didSet {
            listCharactersUpdated?()
        }
    }
    var hasNextPage = true {
        didSet {
            if hasNextPage == true {
                page += 1
            }
        }
    }
    var page: Int = 1
    var listCharactersUpdated: (() -> Void)?
    var errorHasOcurred: ((Error) -> Void)?

    init(router: ListRouterProtocol, characterUseCase: CharacterUseCaseProtocol) {
        self.router = router
        self.characterUseCase = characterUseCase
    }
}

extension ListViewModel {
    //MARK: Life cycle
    func viewDidLoad() {
        loadCharacters()
    }

    func viewDidAppear() {

    }

    func viewDidDisappear() {

    }

    //MARK: Actions
    func loadMoreCharacter(currentItem: Int){
        if (characters.count - 5 < currentItem) && hasNextPage {
            switch currentStatus {
            case .searching:
                search(this: currentSearch)
            case .listing:
                loadCharacters()
            }
        }
    }

    func loadCharacters() {
        if !hasNextPage { return }
        Task {
            do {
                let (characters, hasNextPage) = try await characterUseCase.getList(for: page)
                self.characters.append(contentsOf: characters)
                self.hasNextPage = hasNextPage
            } catch {
                errorHasOcurred?(error)
            }
        }
    }

    func search(this name: String) {
        if name.isEmpty {
            loadCharacters()
            return
        }
        currentSearch = name
        if !hasNextPage { return }
        Task {
            do {
                let (characters, hasNextPage) = try await characterUseCase.search(this: name, for: page)
                self.characters.append(contentsOf: characters)
                self.hasNextPage = hasNextPage
            } catch {
                errorHasOcurred?(error)
            }
        }
    }
}

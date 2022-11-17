//
//  HomeController.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import UIKit

final class ListViewController: BaseViewController {
    var viewModel: ListViewModelProtocol!
    lazy var searchBar:UISearchBar = UISearchBar()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
        setupSearch()
        configure()
        viewModel.viewDidLoad()
    }

    func setupBinding() {
        viewModel.listCharactersUpdated = { 	
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        viewModel.errorHasOcurred = { error in
            print(error)
        }
    }

    func setupSearch() {
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Buscar..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }

    func configure(){
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellReuseIdentifier: "CharacterCell")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.viewModel.loadMoreCharacter(currentItem: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterCell
        cell.character = self.viewModel.characters[indexPath.row]
        return cell
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.search(this: searchText)
    }
}

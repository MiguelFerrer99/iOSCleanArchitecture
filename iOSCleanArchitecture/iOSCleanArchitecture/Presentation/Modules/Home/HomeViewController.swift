//
//  HomeController.swift
//  clean
//
//  Created by Fernando Salom Carratala on 6/11/22.
//

import UIKit

final class HomeViewController: BaseViewController {
    var viewModel: HomeViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onPressed(_ sender: Any) {
        self.navigationController?.pushViewController(ListBuilder().build(), animated: true)
    }
}

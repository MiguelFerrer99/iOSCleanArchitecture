//
//  HomeController.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit
import Combine

final class HomeViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    
    private let viewModel: HomeViewModel
    private let dependencies: HomeDependenciesResolver
    private var subscriptions: Set<AnyCancellable> = []
    private lazy var exampleView: ExampleView = {
        let view = ExampleView()
        view.configure(with: "Hello, World!")
        return view
    }()

    init(dependencies: HomeDependenciesResolver) {
        self.dependencies = dependencies
        self.viewModel = dependencies.resolve()
        super.init(nibName: "HomeViewController", bundle: .main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        bind()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}

private extension HomeViewController {
    func setAppearance() {
        configureExampleView()
    }
    
    func configureExampleView() {
        stackView.addArrangedSubview(exampleView)
    }
    
    func bind() {
        bindViewModel()
    }
    
    func bindViewModel() {
        // Bind ViewModel states
    }
    
    func configureNavigationBar() {
        // Configure NavigationBar
    }
}

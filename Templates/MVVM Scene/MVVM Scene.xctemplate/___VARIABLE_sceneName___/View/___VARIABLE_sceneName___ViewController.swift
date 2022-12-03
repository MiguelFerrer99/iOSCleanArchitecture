//
//  ___FILEBASENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import Combine

final class ___VARIABLE_sceneName___ViewController: UIViewController {
    private let viewModel: ___VARIABLE_sceneName___ViewModel
    private let dependencies: ___VARIABLE_sceneName___DependenciesResolver
    private var subscriptions: Set<AnyCancellable> = []

    init(dependencies: ___VARIABLE_sceneName___DependenciesResolver) {
        self.dependencies = dependencies
        self.viewModel = dependencies.resolve()
        super.init(nibName: "___VARIABLE_sceneName___ViewController", bundle: .main)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
}

private extension ___VARIABLE_sceneName___ViewController {
    var sceneNavigationController: UINavigationController {
        dependencies.external.resolve()
    }
    
    func setupViews() {
        // Configure views
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

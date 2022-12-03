//
//  ExampleView.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit
import Combine

enum ExampleViewState {
    // Define states
}

final class ExampleView: XibView {
    @IBOutlet private weak var titleLabel: UILabel!
    
    private var subscriptions = Set<AnyCancellable>()
    private var subject = PassthroughSubject<ExampleViewState, Never>()
    var publisher: AnyPublisher<ExampleViewState, Never> {
        subject.eraseToAnyPublisher()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        bind()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        bind()
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

private extension ExampleView {
    func setupView() {
        titleLabel.font = .systemFont(ofSize: 18)
    }
    
    func bind() {
        // Bind subviews states
    }
}

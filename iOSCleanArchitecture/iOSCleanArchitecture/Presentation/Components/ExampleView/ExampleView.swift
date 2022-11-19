//
//  ExampleView.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

final class ExampleView: XibView {
    @IBOutlet private weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}

private extension ExampleView {
    func setupView() {
        titleLabel.font = .systemFont(ofSize: 18)
    }
}

//
//  ___FILEBASENAME___.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit
import Combine

enum ___FILEBASENAME___State {
    // Define states
}

final class ___FILEBASENAME___: XibView {
    private var subscriptions = Set<AnyCancellable>()
    private var subject = PassthroughSubject<___FILEBASENAME___State, Never>()
    var publisher: AnyPublisher<___FILEBASENAME___State, Never> {
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
}

private extension ___FILEBASENAME___ {
    func bind() {
        // Bind states
    }
    
    func setupView() {
        // Configure view
    }
}

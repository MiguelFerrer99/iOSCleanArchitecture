//
//  UIView+Extension.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import UIKit

extension UIView {
    func fullFit(topMargin: CGFloat = 0, bottomMargin: CGFloat = 0, leftMargin: CGFloat = 0, rightMargin: CGFloat = 0) {
        guard let container = self.superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: container.leftAnchor, constant: leftMargin),
            self.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -rightMargin),
            self.topAnchor.constraint(equalTo: container.topAnchor, constant: topMargin),
            self.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -bottomMargin)
        ])
    }
}

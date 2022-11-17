//
//  UImageView.swift
//  clean
//
//  Created by Fernando Salom Carratala on 15/11/22.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        self.image = nil
        let backupURL = url
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        if url == backupURL {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}

//
//  Collection+Extension.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

extension Collection {
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

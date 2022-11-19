//
//  Pagination.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Foundation

final class Pagination<T> {
    typealias Item = T
    
    fileprivate var items: [Item] = []
    fileprivate var nextPage: Int?
    fileprivate(set) var currentPage = 1
    
    var isLastPage: Bool { nextPage.isNil }
    
    func setItems(_ items: [Item]) {
        if currentPage == 1 {
            self.items = items
        } else {
            self.items.append(contentsOf: items)
        }
        currentPage += 1
    }
    
    func setNextPage(_ nextPage: Int?) {
        self.nextPage = nextPage
    }
    
    func getItems() -> [Item] {
        return items
    }
}

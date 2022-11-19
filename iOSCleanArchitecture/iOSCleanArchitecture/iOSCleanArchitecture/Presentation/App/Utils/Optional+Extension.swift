//
//  Optional+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 16/10/22.
//

import Foundation

extension Optional {
    var isNil: Bool {
        return self == nil
    }
    
    var isNotNil: Bool {
        return self != nil
    }
}

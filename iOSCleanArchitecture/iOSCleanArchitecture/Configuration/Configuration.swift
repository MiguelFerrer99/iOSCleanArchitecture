//
//  Configuration.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 23/9/22.
//

import Foundation
import SwiftUI

final class Configuration {
    static let shared = Configuration()
    
    let API_HOST: String = ""
    let API_KEY: String = ""
    let BASE_URL: String = ""
    
    init() {
        #if Demo
            API_HOST = "free-nba.p.rapidapi.com"
            API_KEY = "6712888557mshc76b1cc5f41bccdp1ac5b5jsn800eedeb2545"
            BASE_URL = "https://free-nba.p.rapidapi.com"
        #elseif Develop
            API_HOST = "free-nba.p.rapidapi.com"
            API_KEY = "6712888557mshc76b1cc5f41bccdp1ac5b5jsn800eedeb2545"
            BASE_URL = "https://free-nba.p.rapidapi.com"
        #elseif Production
            API_HOST = "free-nba.p.rapidapi.com"
            API_KEY = "6712888557mshc76b1cc5f41bccdp1ac5b5jsn800eedeb2545"
            BASE_URL = "https://free-nba.p.rapidapi.com"
        #endif
    }
}

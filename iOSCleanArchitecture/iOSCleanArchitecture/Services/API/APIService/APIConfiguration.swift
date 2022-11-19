//
//  APIConfiguration.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

final class APIConfiguration {
    static let shared = APIConfiguration()
    
    let API_HOST: String = ""
    let API_KEY: String = ""
    let BASE_URL: String = ""
    
    private init() {
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

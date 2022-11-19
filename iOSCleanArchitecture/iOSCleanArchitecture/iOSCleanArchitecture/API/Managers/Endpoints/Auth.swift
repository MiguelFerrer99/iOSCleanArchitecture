//
//  Auth.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

enum AuthEndpoint {
    case login([String:Any])
    case refreshToken([String:Any])
    
    var endpoint: Endpoint {
        get {
            switch self {
            case .login(let parameters):
                return Endpoint(path: "/login",
                                httpMethod: .post,
                                parameters: parameters,
                                mock: "Login")
            case .refreshToken(let parameters):
                return Endpoint(path: "/refresh_token",
                                httpMethod: .post,
                                parameters: parameters,
                                mock: "RefreshToken")
            }
        }
    }
}

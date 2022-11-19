//
//  Auth.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Foundation

enum AuthEndpoint {
    case login([String:Any])
    case refreshToken([String:Any])
    
    var endpoint: APIEndpoint {
        get {
            switch self {
            case .login(let parameters):
                return APIEndpoint(path: "/login",
                                httpMethod: .post,
                                parameters: parameters,
                                mock: "Login")
            case .refreshToken(let parameters):
                return APIEndpoint(path: "/refresh_token",
                                httpMethod: .post,
                                parameters: parameters,
                                mock: "RefreshToken")
            }
        }
    }
}

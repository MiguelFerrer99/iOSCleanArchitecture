//
//  APIAuthManager.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Foundation

enum APIAuthManagerError: Error {
    case missingToken
    case missingExpiresIn
    case badRequest
    case tokenNotFound
}

actor APIAuthManager {
    private var refreshTask: Task<String, Error>?
    
    // MARK: Return accessToken or error
    func getAccesToken() async throws -> String? {
        guard let accessToken = AppInfoManager.get(stringFor: .access_token) else {
            throw APIAuthManagerError.missingToken
        }
        return accessToken
    }
    
    // MARK: Return if access token is still valid or thrwo an error
    func isValid() async throws -> Bool {
        guard let expires = Calendar.current.date(byAdding: .second, value: AppInfoManager.get(intFor: .expires_in), to: Date()) else {
            throw APIAuthManagerError.missingExpiresIn
        }
        return expires > Date() ? true : false
    }
    
    // MARK: Check if token is valid or refresh token otherwise
    func validToken() async throws -> String {
        if let handle = refreshTask {
            return try await handle.value
        }
        let isValid = try await isValid()
        if isValid {
            guard let accessToken = try await getAccesToken() else {
                throw APIAuthManagerError.missingToken
            }
            return accessToken
        }
        return try await refreshToken()
    }
    
    // MARK: Create a task and call refreshToken if needed
    func refreshToken() async throws -> String {
        if let refreshTask = refreshTask {
            return try await refreshTask.value
        }
        let task = Task { () throws -> String in
            defer { refreshTask = nil }
            guard let refreshToken = AppInfoManager.get(stringFor: .refresh_token) else {
                throw APIAuthManagerError.tokenNotFound
            }
            return try await refresh(with: refreshToken)
        }
        self.refreshTask = task
        return try await task.value
    }
    
    // MARK: Call to login service
    func authenticate(with parameters: [String: Any]) async throws -> String {
        do {
            let token = try await APIService.shared.load(endpoint: AuthEndpoint.login(parameters).endpoint, of: TokenDTO.self)
            save(this: token)
            return token.accessToken
        } catch let error {
            APILogger.thisError(error)
            throw APIAuthManagerError.badRequest
        }
    }
    
    // MARK: Save token data
    func save(this token: TokenDTO) {
        AppInfoManager.set(.access_token, token.accessToken)
        AppInfoManager.set(.refresh_token, token.refreshToken)
        AppInfoManager.set(.expires_in, token.expiresIn)
    }
    
    // MARK: Call API for refreshToken
    func refresh(with refreshToken: String) async throws -> String {
        do {
            let parameters: [String: Any] = [
                "grant_type": "refresh_token",
                "client_id": APIConfiguration.shared.API_HOST,
                "client_secret": APIConfiguration.shared.API_KEY,
                "refresh_token": refreshToken
            ]
            let token = try await APIService.shared.load(endpoint: AuthEndpoint.refreshToken(parameters).endpoint, of: TokenDTO.self)
            save(this: token)
            return token.accessToken
        } catch let error {
            APILogger.thisError(error)
            AppInfoManager.clear()
            throw APIAuthManagerError.badRequest
        }
    }
}

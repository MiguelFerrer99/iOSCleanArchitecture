//
//  AuthManager.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation

enum AuthError: Error {
    case missingToken
    case missingExpiresIn
    case badRequest
    case tokenNotFound
}

actor AuthManager {
    private var refreshTask: Task<String, Error>?
    
    // MARK: Return accessToken or error
    func getAccesToken() async throws -> String? {
        guard let accessToken = AppInfoManager.get(stringFor: .access_token) else {
            throw AuthError.missingToken
        }
        return accessToken
    }
    
    // MARK: Return if access token is still valid or thrwo an error
    func isValid() async throws -> Bool {
        guard let expires = Calendar.current.date(byAdding: .second, value: AppInfoManager.get(intFor: .expires_in), to: Date()) else {
            throw AuthError.missingExpiresIn
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
                throw AuthError.missingToken
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
                throw AuthError.tokenNotFound
            }
            return try await refresh(with: refreshToken)
        }
        self.refreshTask = task
        return try await task.value
    }
    
    // MARK: Call to login service
    func authenticate(with parameters: [String: Any]) async throws -> String {
        do {
            let token = try await Network.shared.load(endpoint: AuthEndpoint.login(parameters).endpoint, of: TokenDTO.self)
            save(this: token)
            return token.accessToken
        } catch let error {
            Log.thisError(error)
            throw AuthError.badRequest
        }
    }
    
    // MARK: Save token data
    func save(this token: TokenDTO) {
        AppInfoManager.set(AppInfoManager.Key.access_token, token.accessToken)
        AppInfoManager.set(AppInfoManager.Key.refresh_token, token.refreshToken)
        AppInfoManager.set(AppInfoManager.Key.expires_in, token.expiresIn)
    }
    
    // MARK: Call API for refreshToken
    func refresh(with refreshToken: String) async throws -> String {
        do {
            let parameters: [String: Any] = [
                "grant_type": "refresh_token",
                "client_id": Configuration.shared.API_HOST,
                "client_secret": Configuration.shared.API_KEY,
                "refresh_token": refreshToken
            ]
            let token = try await Network.shared.load(endpoint: AuthEndpoint.refreshToken(parameters).endpoint, of: TokenDTO.self)
            save(this: token)
            return token.accessToken
        } catch let error {
            Log.thisError(error)
            AppInfoManager.clear()
            throw AuthError.badRequest
        }
    }
}

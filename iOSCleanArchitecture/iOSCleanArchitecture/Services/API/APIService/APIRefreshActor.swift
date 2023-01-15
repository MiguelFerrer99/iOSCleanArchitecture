//
//  APIAuthManager.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

actor APIRefreshActor {
    private let service: APIService
    
    init(service: APIService) {
        self.service = service
    }
    
    // MARK: - refresh - Call API for refreshToken
    func refresh(with refreshToken: String) async throws -> String {
        do {
            let parameters: [String: Any] = [
                "grant_type": "refresh_token",
                "client_id": getClientId(),
                "client_secret": getClientSecret(),
                "refresh_token": refreshToken
            ]
            let token = try await service.load(endpoint: AuthEndpoint.refreshToken(parameters).endpoint, of: TokenDTO.self)
            AppInfoManager.set(.access_token, token.accessToken)
            AppInfoManager.set(.refresh_token, token.refreshToken)
            return token.accessToken
        } catch let error {
            APILogger.thisError(error)
            AppInfoManager.clear()
            throw error
        }
    }
    
    // MARK: - getClientId - Call Back Client ID
    private func getClientId() -> String {
        #if Demo
            return ""
        #elseif Develop
            return ""
        #elseif Production
            return ""
        #else
            return ""
        #endif
    }
    
    // MARK: - getClientSecret - Call Back Client Secret
    private func getClientSecret() -> String {
        #if Demo
            return ""
        #elseif Develop
            return ""
        #elseif Production
            return ""
        #else
            return ""
        #endif
    }
}

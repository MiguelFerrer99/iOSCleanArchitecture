//
//  Network.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case mockNotFound
    case missingToken
    case invalidToken
    case invalidResponse
    case errorDecodable
    case errorData(Data)
    
    var localizedDescription: String {
        switch self {
        case .mockNotFound: return "Mock not found"
        case .missingToken: return "Access Token not found"
        case .invalidToken: return "Access Token not valid"
        case .invalidResponse: return "Response not expected"
        case .errorDecodable: return "Error while decoding object. Check your DTO"
        case .errorData(let data): return "Error reponse with data: \(data.prettyPrintedJSONString ?? "")"
        }
    }
    
    var data: Data {
        switch self {
        case .errorData(let data): return data
        default: return Data()
        }
    }
}

class Network {
    static var shared = Network(authManager: AuthManager())
    
    let authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
    }
    
    // MARK: - loadAuthorized - Call secured API
    func loadAuthorized<T: Decodable>(endpoint: Endpoint, of type: T.Type, allowRetry: Bool = true) async throws -> T {
        var request = endpoint.request
        endpoint.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        let token = try await authManager.validToken()
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        Log.thisCall(request)
        #if Demo
            return try await loadDemo(endpoint: endpoint, of: T.self)
        #else
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            guard let response = urlResponse as? HTTPURLResponse else {
                Log.thisError(NetworkError.invalidResponse)
                throw NetworkError.invalidResponse
            }
            if response.statusCode == 401 {
                if allowRetry {
                    _ = try await authManager.refreshToken()
                    return try await loadAuthorized(endpoint: endpoint, of: type, allowRetry: false)
                }
            }
            Log.thisResponse(response, data: data)
            let decoder = JSONDecoder()
            var parsedData: T!
            do {
                parsedData = try decoder.decode(T.self, from: data)
            } catch {
                if (200..<300).contains(response.statusCode) {
                    Log.thisError(NetworkError.errorDecodable)
                    throw NetworkError.errorDecodable
                } else {
                    Log.thisError(NetworkError.errorData(data))
                    throw NetworkError.errorData(data)
                }
            }
            return parsedData
        #endif
    }
    
    // MARK: - load - Call unprotected API
    func load<T: Decodable>(endpoint: Endpoint, of type: T.Type) async throws -> T {
        var request = endpoint.request
        endpoint.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        Log.thisCall(request)
        #if Demo
            return try await loadDemo(endpoint: endpoint, of: T.self)
        #else
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            guard let response = urlResponse as? HTTPURLResponse else {
                Log.thisError(NetworkError.invalidResponse)
                throw NetworkError.invalidResponse
            }
            do {
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                Log.thisResponse(response, data: data)
                return parsedData
            } catch {
                Log.thisError(error)
                throw NetworkError.errorDecodable
            }
        #endif
    }
}

private extension Network {
    func loadDemo<T: Decodable>(endpoint: Endpoint, of type: T.Type) async throws -> T {
        guard let url = Bundle.main.url(forResource: endpoint.mock, withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            Log.thisError(NetworkError.mockNotFound)
            throw NetworkError.mockNotFound
        }
        do {
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            guard let url = URL(string: "\(endpoint.mock)_Mock"),
                  let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil) else {
                Log.thisError(NetworkError.invalidResponse)
                throw NetworkError.invalidResponse
            }
            Log.thisResponse(response, data: data)
            return parsedData
        } catch {
            Log.thisError(error)
            throw NetworkError.errorDecodable
        }
    }
}

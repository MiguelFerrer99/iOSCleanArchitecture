//
//  APILogger.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Foundation

enum APILoggerType {
    case error
    case info
    case warning
    case debug
    case verbose
}

final class APILogger {
    static func time() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.string(from: date)
    }
    
    static func this(_ message: String, file: String = #file, function: String = #function, line: Int = #line, type: APILoggerType = .debug) {
        let path = file.split(separator: "/")
        let file = path.last?.split(separator: ".")
        
        var icon = "📝"
        switch type {
        case .debug:   icon = "💚 DEBUG"
        case .info:    icon = "💙 INFO"
        case .warning: icon = "💛 WARNING"
        case .error:   icon = "❤️ ERROR"
        case .verbose: icon = "💜 VERBOSE"
        }
        
        print("\(self.time()) \(icon) \(file?.first ?? "").\(function):\(line) - \n\n\t\(message)\n")
    }
    
    static func thisCall(_ call: URLRequest) {
        let url     = call.url?.absoluteString ?? ""
        let headers = call.allHTTPHeaderFields ?? [:]
        let method  = call.httpMethod ?? ""
        let params  = String(data: call.httpBody ?? Data(), encoding: .utf8)
        
        print("------------------------------------------")
        print("➡️ \(method) \(url)")
        print("HEADERS: \(headers)")
        print("BODY PARAMETERS: \(params ?? "")")
        print("------------------------------------------")
    }
    
    static func thisResponse(_ response: URLResponse, data: Data) {
        guard let response = response as? HTTPURLResponse else { return }
        let code = response.statusCode
        let url  = response.url?.absoluteString ?? ""
        let icon = [200, 201, 204].contains(code) ? "✅" : "❌"
        
        print("------------------------------------------")
        print("\(icon) 🔽 [\(code)] \(url)")
        print("\(data.prettyPrintedJSONString ?? "")")
        print("\(icon) 🔼 [\(code)] \(url)")
        print("------------------------------------------")
    }
    
    static func thisError(_ error : Error) {
        print("🤬 ERROR: \(error.localizedDescription)")
        print("🤬 Description: \(error)")
        print("------------------------------------------")
    }
    
    static func thisError(_ error : APIServiceError) {
        print("🤬 ERROR: \(error.localizedDescription)")
        print("🤬 Description: \(error)")
        print("------------------------------------------")
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .withoutEscapingSlashes]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}

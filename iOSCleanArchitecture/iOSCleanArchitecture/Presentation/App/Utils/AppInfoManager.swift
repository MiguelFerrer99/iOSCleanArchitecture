//
//  AppInfoManager.swift
//  iOSCleanArchitecture
//
//  Created by Miguel Ferrer Fornali on 19/11/22.
//

import Foundation

final class AppInfoManager {
    enum Key: String {
        case refresh_token,
             access_token,
             logged,
             userID
    }
    
    static func set(_ key: Key, _ value: Any?) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
    static func get(stringFor: Key) -> String? {
        return UserDefaults.standard.string(forKey: stringFor.rawValue)
    }
    
    static func get(intFor: Key) -> Int {
        return UserDefaults.standard.integer(forKey: intFor.rawValue)
    }
    
    static func get(doubleFor: Key) -> Double {
        return UserDefaults.standard.double(forKey: doubleFor.rawValue)
    }
    
    static func get(floatFor: Key) -> Float {
        return UserDefaults.standard.float(forKey: floatFor.rawValue)
    }
    
    static func get(boolFor: Key) -> Bool {
        return UserDefaults.standard.bool(forKey: boolFor.rawValue)
    }
    
    static func get(arrayFor: Key) -> [Any]? {
        return UserDefaults.standard.array(forKey: arrayFor.rawValue)
    }
    
    static func get(anyFor: Key) -> Any? {
        return UserDefaults.standard.object(forKey: anyFor.rawValue) as Any
    }
    
    static func get(dictionaryArrayFor: Key) -> [String: [Any]]? {
        return UserDefaults.standard.dictionary(forKey: dictionaryArrayFor.rawValue) as? [String: [Any]]
    }
    
    static func get(dictionaryFor: Key) -> [String: Any]? {
        return UserDefaults.standard.dictionary(forKey: dictionaryFor.rawValue)
    }
    
    static func save<T: Codable>(objectFor: Key, this data: T){
        guard let encodedData = try? JSONEncoder().encode(data) else {
            print("🤬 ERROR: Cache.save(objectFor: \(objectFor.rawValue)) > JSON ENCODER ERROR")
            return
        }
        UserDefaults.standard.set(encodedData, forKey: objectFor.rawValue)
    }
    
    static func retrieve<T: Decodable>(objectFor: Key, of type: T.Type) -> T? {
        guard let savedData = UserDefaults.standard.object(forKey: objectFor.rawValue) as? Data  else { return nil }
        guard let object = try? JSONDecoder().decode(T.self, from: savedData) else { return nil }
        return object
    }
    
    static func printAll() {
        print("[CacheHandler] Print Userdefaults:")
        print("------------------------------------")
        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
            print("\(key) = \(value)")
        }
        print("------------------------------------")
    }
    
    static func clear() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    static func logOut() {
        AppInfoManager.set(.logged, false)
        AppInfoManager.set(.userID, nil)
    }
}

//
//  Authentication.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 8/8/25.
//
import Foundation
import os
import KeychainSwift

class Authentication {
    static let shared = Authentication()
    let logger = Logger()
    let keychain = KeychainSwift()
    
    func createNewAccount(name: String, email: String, password: String) async throws -> String {
        guard let url = URL(string: "http://localhost:3001/api/users") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let payload: [String: Any] = ["name": name, "email": email, "password": password]
        request.httpBody = try JSONSerialization.data(withJSONObject: payload)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }
            
            print("Authentication Response From Server: \(httpResponse)")
            if httpResponse.statusCode == 200 {
                if let token = httpResponse.value(forHTTPHeaderField: "x-auth-token") {
                    keychain.set(token, forKey: "ACCESS_TOKEN")
                    keychain.set(true, forKey: "isLoggedIn")
                    return  "Success"
                } else {
                    throw AuthError.missingToken
                }
            } else {
                let errorString = String(data: data, encoding: .utf8) ?? "Unknown error"
                throw AuthError.serverError(errorString)
            }
            
           
        }catch {
            logger.error("Account creation failed: \(error.localizedDescription)");
            throw error
        }
        
    }
}

enum AuthError: Error {
    case missingToken
    case serverError(String)
}

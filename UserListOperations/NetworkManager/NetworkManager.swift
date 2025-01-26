//
//  NetworkManager.swift
//  UserListOperations
//
//  Created by Burak Pala on 26.01.2025.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = ServiceConstants.baseURL
    
    private init() {}
    
    func fetchUsers(completion: @escaping (Result<[Users], Error>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 404, userInfo: nil)))
                return
            }
            
            do {
                let productElements = try JSONDecoder().decode([Users].self, from: data)
                completion(.success(productElements))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    
}

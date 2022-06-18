//
//  NetworkManager.swift
//  SimpleCompositionalLayout
//
//  Created by EDUARD Latynsky on 18.06.2022.
//

import Foundation
protocol NetworkManagerProtocol {
    func loadData(completion: @escaping(Result<Sections, NetworkErrors>) -> ())
}

class NetworkManager:NetworkManagerProtocol {
    private let link = "https://api.jsonbin.io/b/620ca6bc1b38ee4b33bd9656"
    
    func loadData(completion: @escaping (Result<Sections, NetworkErrors>) -> ()) {
        guard let url = URL(string: link) else {
            completion(.failure(.urlError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion(.failure(.dataTaskError))
                return
            }
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let data = try JSONDecoder().decode(Sections.self, from: data)
                completion(.success(data))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        
        task.resume()
        
    }
}

enum NetworkErrors: Error {
    case urlError, dataTaskError, decodeError, dataError
}

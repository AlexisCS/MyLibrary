//
//  NetworkSession.swift
//  KavakProyect
//
//  Created by Alexis Celestino Solís on 22/09/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

struct UrlSession {
    static func get(operationQueue: DispatchQueue = DispatchQueue.global(qos: .default),
                    completionQueue: DispatchQueue = DispatchQueue.main,
                    completion: @escaping (Result<Brastlewark, Error>) -> ()) {
        operationQueue.async {
            let urlString: String = "https://raw.githubusercontent.com/rrafols/mobile_test/master/data.json"
            guard let url = URL(string: urlString) else {
                completionQueue.async {
                    completion(.failure(ErrorHandler.invalidURL))
                }
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completionQueue.async {
                         completion(.failure(error))
                    }
                }
                guard let data = data,
                      let result: Brastlewark = try? JSONDecoder().decode(Brastlewark.self, from: data) else {
                    completionQueue.async {
                         completion(.failure(ErrorHandler.buildResponse))
                    }
                    return
                }
                completionQueue.async {
                    completion(.success(result))
                }
            }.resume()
        }
    }
}

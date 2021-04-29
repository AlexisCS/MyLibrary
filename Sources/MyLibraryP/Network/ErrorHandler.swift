//
//  ErrorHandler.swift
//  KavakProyect
//
//  Created by Alexis Celestino Solís on 23/09/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

struct ErrorHandler: Error {
    let name: String
    let code: Int
    let description: String
    
    var localizedDescription: String {
        return description
    }
}

extension ErrorHandler {
    static var invalidURL: ErrorHandler {
        return ErrorHandler(name: "Invalid Url", code: -1, description: "")
    }
    
    static var parsingJSON: ErrorHandler {
        return ErrorHandler(name: "Parsing JSON", code: -1, description: "")
    }
    
    static var buildResponse: ErrorHandler {
        return ErrorHandler(name: "Build Response", code: -1, description: "")
    }
}

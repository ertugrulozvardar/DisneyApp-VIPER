//
//  HTTPMethods.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

enum HTTPMethods {
    case get
    case post
    case put
    case delete
    case update
}

func getHttpMethod(httpMethod: HTTPMethods) -> String? {
    switch httpMethod {
    case .get:
        return "GET"
    case .post:
        return "POST"
    case .put:
        return "PUT"
    case .delete:
        return "DELETE"
    case .update:
        return "UPDATE"
    default:
        break
    }
}

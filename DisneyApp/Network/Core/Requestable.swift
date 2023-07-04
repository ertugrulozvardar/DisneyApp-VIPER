//
//  Requestable.swift
//  DisneyApp
//
//  Created by ertugrul.ozvardar on 19.06.2023.
//

import Foundation

protocol Requestable {
    var baseURL: String { get }
    var URLpath: String { get }
    func convertToURLRequest() -> URLRequest
}

extension Requestable {
    
    var baseURL: String {
        return "https://api.disneyapi.dev"
    }
    
    func convertToURLRequest() -> URLRequest {
        var request = URLRequest(url: URL(string: URLpath)!)
        request.httpMethod = getHttpMethod(httpMethod: .get)
        return request
    }
}

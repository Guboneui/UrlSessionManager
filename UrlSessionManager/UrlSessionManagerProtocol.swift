//
//  UrlSessionManagerProtocol.swift
//  UrlSessionManager
//
//  Created by 구본의 on 2023/01/19.
//

import Foundation

protocol UrlSessionManagerProtocol {
  func makeRequest(url: String, method: HttpMethod) async -> URLRequest
  
}

extension UrlSessionManagerProtocol {
  func makeRequest(url: String, method: HttpMethod) async -> URLRequest{
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = method.rawValue
    return request
  }
}


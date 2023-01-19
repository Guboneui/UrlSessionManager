//
//  UrlSessionManagerProtocol.swift
//  UrlSessionManager
//
//  Created by 구본의 on 2023/01/19.
//

import Foundation

protocol UrlSessionManagerProtocol {
  func makePlaneRequest(url: String, method: HttpMethod) async -> URLRequest
  func makeQueryRequest(url: String, method: HttpMethod, query: [String:Any]) async -> URLRequest
}

extension UrlSessionManagerProtocol {
  func makePlaneRequest(url: String, method: HttpMethod) async -> URLRequest{
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = method.rawValue
    return request
  }
  
  func makeQueryRequest(url: String, method: HttpMethod, query: [String:Any]) async -> URLRequest {
    var queryString = query.map{"?\($0)=\($1)"}.joined()
    var request = URLRequest(url: URL(string: url+queryString)!)
    request.httpMethod = method.rawValue
    return request
  }
  
  func makeParameterRequest(url: String, method: HttpMethod, parameter: [String:Any]) async -> URLRequest {
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = method.rawValue
    request.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: [])
    return request
  }
}


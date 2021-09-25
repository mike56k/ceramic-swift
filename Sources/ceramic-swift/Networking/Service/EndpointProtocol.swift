//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//

public enum Scheme: String {
  case http, https
}

/// A dictionary of parameters to apply to a `URLRequest`
public typealias Parameters = [(String, Any)]

/// A dictionary of headers to apply to a `URLRequest`
public typealias HTTPHeaders = [String: String]

// MARK: - HTTPMethod

public enum HTTPMethod: String {
  case get = "GET"
  case head = "HEAD"
  case post = "POST"
  case put = "PUT"
  case delete = "DELETE"
  case connect = "CONNECT"
  case options = "OPTIONS"
  case trace = "TRACE"
  case patch = "PATCH"
}

// MARK: - EndpointProtocol

public protocol EndpointProtocol {
  var scheme: Scheme { get }
  var host: String { get }
  var path: String { get }
  var method: HTTPMethod { get }
  var parameters: [(String, Any)]? { get }
  var encoding: ParameterEncoding { get }
  var headers: HTTPHeaders? { get }
  var cacheKey: String? { get }
}

// MARK: - ParameterEncoding

public enum ParameterEncoding {
  case httpBody
  case queryString
}

extension EndpointProtocol {
  public var scheme: Scheme {
    .https
  }

  public var encoding: ParameterEncoding {
    switch method {
    case .get:
      return .queryString

    default:
      return .httpBody
    }
  }

  public var headers: HTTPHeaders? {
    [:]
  }

  public var cacheKey: String? {
    nil
  }
}

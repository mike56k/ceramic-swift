//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//

private enum StreamsEnpoint: EndpointProtocol {
  case state
    
  var host: String {
    domain
  }

  var path: String {
    switch self {
    case .state:
      return "/api/v0/streams"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .state:
      return .get
    }
  }

  var parameters: Parameters? {
    switch self {
    case .state:
      return nil
    }
  }
    
}

// MARK: - Collections

public final class Stream {

  // MARK: Lifecycle

  private init() {}

  // MARK: Public

  public static let shared = Stream()

  public func getStreamState(completion: @escaping (Result<StreamState, APIError>) -> Void) {
    api.request(endpoint: StreamsEnpoint.state, completion: completion)
  }

  // MARK: Private

  private let api = API.shared
}

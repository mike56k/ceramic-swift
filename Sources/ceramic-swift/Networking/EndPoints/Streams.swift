//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//

private enum StreamsEnpoint: EndpointProtocol {
  case state(streamID: String)
    
  var host: String {
    domain
  }

  var path: String {
    switch self {
    case .state(let streamID):
      return "/api/v0/streams/" + String(streamID)
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

    public func getStreamState(streamID: String,
                               completion: @escaping (Result<StreamState, APIError>) -> Void) {
    api.request(endpoint: StreamsEnpoint.state(streamID: streamID), completion: completion)
  }

  // MARK: Private

  private let api = API.shared
}

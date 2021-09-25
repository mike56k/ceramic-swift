//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//

private enum StreamsEnpoint: EndpointProtocol {    
  case state(streamID: String)
  case createStream(didKey: String)
    
  var host: String {
    domain
  }

  var path: String {
    switch self {
    case .state(let streamID):
      return "/api/v0/streams/" + String(streamID)
    case .createStream:
        return "/api/v0/streams"
    }
  }

  var method: HTTPMethod {
    switch self {
    case .state:
      return .get
    case .createStream:
      return .post
    }
  }

  var parameters: Parameters? {
    switch self {
    case .state:
      return nil
    case .createStream(let didKey):
        return [
            "type": 0,
            "genesis": [
                "family": "test",
                "controllers": ["did:key:" + didKey]
            ]
        ]
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
    
  public func createStream(didKey: String,
                             completion: @escaping (Result<StreamState, APIError>) -> Void) {
    api.request(endpoint: StreamsEnpoint.createStream(didKey: didKey), completion: completion)
  }

  // MARK: Private

  private let api = API.shared
}

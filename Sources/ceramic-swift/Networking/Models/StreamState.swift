//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//
import Foundation

// MARK: - Welcome
public struct StreamState: Decodable {
    public let streamID: String?
    public let state: State?
    
    private enum CodingKeys: String, CodingKey {
      case streamID = "streamId"
      case state = "state"
    }
}

// MARK: - State
public struct State: Decodable {
    public let type: Int?
    public let content: Content?
    public let metadata: Metadata?
    public let signature: Int?
    public let anchorStatus: String?
    public let log: [Log]?
    public let anchorProof: AnchorProof?
    public let doctype: String?
}

// MARK: - AnchorProof
public struct AnchorProof: Decodable {
    public let root, txHash, chainID: String?
    public let blockNumber: Int?
    public let blockTimestamp: Int?
    private enum CodingKeys: String, CodingKey {
        case root
        case txHash
        case chainID = "chainId"
        case blockNumber
        case blockTimestamp
    }
}

// MARK: - Content
public struct Content: Decodable {
}

// MARK: - Log
public struct Log: Decodable {
    public let cid: String?
    public let type, timestamp: Int?
}

// MARK: - Metadata
public struct Metadata: Decodable {
    public let family: String?
    public let controllers: [String]?
}

//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//

public struct StreamState: Decodable {
    public let streamID: String
    public let state: State
}

// MARK: - State
public struct State: Decodable {
    public let type: Int
    public let content: Content
    public let metadata: Metadata
    public let signature: Int
    public let anchorStatus: String
    public let log: [Log]
    public let doctype: String
}

// MARK: - Content
public struct Content: Decodable {
}

// MARK: - Log
public struct Log: Decodable {
    public let cid: String
    public let type: Int
}

// MARK: - Metadata
public struct Metadata: Decodable {
    public let family: String
    public let controllers: [String]
}


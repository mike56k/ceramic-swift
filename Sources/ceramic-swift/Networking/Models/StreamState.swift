//
//  File.swift
//  
//
//  Created by Михаил Исаченко on 25.09.2021.
//

public struct StreamState: Decodable {
    let streamID: String
    let state: State
}

// MARK: - State
public struct State: Decodable {
    let type: Int
    let content: Content
    let metadata: Metadata
    let signature: Int
    let anchorStatus: String
    let log: [Log]
    let doctype: String
}

// MARK: - Content
public struct Content: Decodable {
}

// MARK: - Log
public struct Log: Decodable {
    let cid: String
    let type: Int
}

// MARK: - Metadata
public struct Metadata: Decodable {
    let family: String
    let controllers: [String]
}


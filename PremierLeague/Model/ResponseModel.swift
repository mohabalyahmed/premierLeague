//
//  ResponseModel.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import Foundation

// MARK: - ResponseModel
struct ResponseModel: Codable {
    let count: Int
    let filters: Filters
    let competition: Competition
    let matches: [Matches]
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int
    let area: Area
    let name, code, plan: String
    let lastUpdated: Date
}

// MARK: - Area
struct Area: Codable {
    let id: Int
    let name: String
}

// MARK: - Filters
struct Filters: Codable {
}

// MARK: - Match
struct Matches: Codable {
    let id: Int
    let season: Season
    let utcDate: Date
    let status: String
    let matchday: Int
    let stage: String
    let group: JSONNull?
    let lastUpdated: Date
    let odds: Odds
    let score: Score
    let homeTeam, awayTeam: Team
    let referees: [Referee]
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String
}
// MARK: - Team
struct Team: Codable {
    let id: Int
    let name: String
}
// MARK: - Referee
struct Referee: Codable {
    let id: Int
    let name, role, nationality: String
}

// MARK: - Score
struct Score: Codable {
    let winner, duration: String
    let fullTime, halfTime, extraTime, penalties: ExtraTime
}

// MARK: - ExtraTime
struct ExtraTime: Codable {
    let homeTeam, awayTeam: Int?
}

// MARK: - Season
struct Season: Codable {
    let id: Int
    let startDate, endDate: String
    let currentMatchday: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


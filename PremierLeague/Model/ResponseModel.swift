//
//  ResponseModel.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import Foundation

// MARK: - ResponseModel
struct ResponseModel: Codable {
    let count: Int?
    let filters: Filters?
    let competition: Competition?
    let matches: [Matches]?
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int?
    let area: Area?
    let name, code, plan: String?
    let lastUpdated: String?
}

// MARK: - Area
struct Area: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Filters
struct Filters: Codable {
}

// MARK: - Match
struct Matches: Codable {
    let id: Int?
    let season: Season?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
    let lastUpdated: String?
    let odds: Odds?
    let score: Score?
    let homeTeam, awayTeam: Team?
    let referees: [Referee]?
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String?
}
// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name: String?
}
// MARK: - Referee
struct Referee: Codable {
    let id: Int?
    let name, role, nationality: String?
}

// MARK: - Score
struct Score: Codable {
    let winner, duration: String?
    let fullTime, halfTime, extraTime, penalties: ExtraTime?
}

// MARK: - ExtraTime
struct ExtraTime: Codable {
    let homeTeam, awayTeam: Int?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
}

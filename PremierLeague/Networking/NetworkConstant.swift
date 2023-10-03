//
//  NetworkConstant.swift
//  PremierLeague
//
//  Created by Mohab Aly on 03/10/2023.
//

import Foundation
class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //
    }
    public var apiToken: String {
        get {
            return "4e6a0928e7274d64877d812d171e0875"
        }
    }
    
    public var apiUrl: String {
        get {
            return "https://api.football-data.org/v2/competitions/2021/matches"
        }
    }
}

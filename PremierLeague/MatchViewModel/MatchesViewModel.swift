//
//  MatchesViewModel.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import Foundation
import Alamofire

class MatchesViewModel {
    var matches: [Matches] = []
    
    func fetchMatches() {
        NetworkHandler.getMatches { result in
            switch result {
            case .success(let data):
                print("hoba count \(data.matches.count)")
            case .failure(let error):
                print("error")
            }
        }
    }
    
    // Provide convenience methods to access match information
    
    func numberOfMatches() -> Int {
        return matches.count
    }
    
    func matchAtIndex(_ index: Int) -> Matches? {
        guard index >= 0 && index < matches.count else {
            return nil
        }
        return matches[index]
    }
    
    // Additional methods or properties as needed
}

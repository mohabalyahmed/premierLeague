//
//  MatchesViewModel.swift
//  PremierLeague
//
//  Created by Mohab Aly on 02/10/2023.
//

import Foundation
import Alamofire

protocol MatchesViewModelDelegate: AnyObject {
    func didFetchMatches(matches: [Matches])
}
class MatchesViewModel {
    var matches: [Matches] = []
    weak var delegate: MatchesViewModelDelegate?
    
    func fetchMatches() {
        NetworkHandler.getMatches { [weak self] result in
            switch result {
            case .success(let data):
                if let matches = data.matches {
                    self?.matches = matches
                    self?.delegate?.didFetchMatches(matches: matches)
                }
//                print("hoba count \(data.matches?.count)")
//                self.matches = data.matches ?? []
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

//
//  NetworkHandler.swift
//  PremierLeague
//
//  Created by Mohab Aly on 03/10/2023.
//

import Foundation
import Alamofire


enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class NetworkHandler {
    
    static func getMatches(completionHandler: @escaping (_ result: Result<ResponseModel, NetworkError>) -> Void) {
        
        let headers: HTTPHeaders = [
            "X-Auth-Token": NetworkConstant.shared.apiToken
        ]
      
        AF.request(NetworkConstant.shared.apiUrl, headers: headers).responseDecodable(of: ResponseModel.self) { response in
            switch response.result {
            case .success(let value):
                completionHandler(.success(value))
            case .failure(let error):
                // Handle the network request error and pass an appropriate error to the completion handler
                print("Network Request Error: \(error.localizedDescription)")
                completionHandler(.failure(.urlError))
            }
        }

    }
}

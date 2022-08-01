//
//  RequestHandler.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import Foundation

class RequestHandler {
    
    func getComics() -> URLRequest {
        let url = apibaseURL + apiEndpoint + apiParams + buildQueryString()
        let request = URLRequest(url: URL(string: url)!)
        return request
        
    }
    
    private func buildQueryString() -> String{
        let timeStamp = Date().timeIntervalSince1970
        let queryString = "&ts=\(timeStamp)&apikey=\(PrivateConstants.publicKey)&hash=\(buildHashToken(timestamp: timeStamp))"
        return queryString
    }
    
    private func buildHashToken(timestamp: TimeInterval) -> String {
        let unhashedString = "\(timestamp)" + PrivateConstants.privateKey + PrivateConstants.publicKey
        return MD5(str: unhashedString)
    }
    
}

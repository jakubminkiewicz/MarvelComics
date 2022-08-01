//
//  RequestHandler.swift
//  MarvelComics
//
//  Created by Jakub Minkiewicz on 01/08/2022.
//

import Foundation

extension JSONDecoder{
    
    func decoderWithRequest<T: Decodable> (_ type: T.Type, fromURLRequest urlRequest: URLRequest , completion: @escaping (T?, Error?) -> Void){
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            if let data = data, statusCode >= 200 && statusCode < 300{
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(result, nil)

                } catch let error{
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }.resume()
    }
}

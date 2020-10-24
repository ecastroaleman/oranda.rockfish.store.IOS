//
//  NetworkingService.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/28/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation

enum MyResult <T, E: Error> {
    case success(T)
    case failure(E)
}

class NetworkingService {
    let baseUrl = "http://35.193.6.214/oauth3/nuevoUsuario.php"
    
    func request(endpoint: String, parameters: [String: Any], completion: @escaping (Result<nUserResponse, Error>) -> Void){
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        
        let finalBody = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.sync {
              
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
             //   print(unwrappedResponse)
                
                switch unwrappedResponse.statusCode {
                case 200 ..< 300:
                    print("Exito")
                default:
                        print("Fallo ERROR")
                }
                
                if let unwrappedError = error {
                    completion(.failure(unwrappedError))
                    return
                }
                
             
               
                if let unwrappedData = data {
                    do {
                      //  let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                      // print (json)
                        
                        if let user = try? JSONDecoder().decode(nUserResponse.self, from: unwrappedData){
                            completion(.success(user))
                           print("Entrò a completion .success")
                        }else {
                            let errorResponse = try JSONDecoder().decode(nUserResponse.self, from: unwrappedData)
                            completion(.failure(errorResponse as! Error))
                            print("Entrò a completion failure")
                        }
                    }catch{
                        print("Entrò al catch")
                        completion(.failure(error))
                    }
                }
            }
            
        }
        task.resume()
    }
    
}

enum NetworkingError: Error {
    case badUrl
    case badResponse
}

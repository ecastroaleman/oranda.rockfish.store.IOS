//
//  getSlides.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/20/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

//
//  NetworkingService.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/28/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation

class getSlides {
    let baseUrl = "http://localhost/oauth3/getSlides.php"
    
    
    func request2(endpoint: String, completion: @escaping (Sliders,String) -> ()) -> String{
        var retorno : String = "OK"
        guard let url = URL(string: baseUrl) else {
          retorno = "La URL es invalida..."
            return retorno
        }
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
    //    request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        request.setValue("Bearer 41fdf5a4da0744a9a5160fea4258306ba58d17db", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request){ data, _, _ in
            
            let posts = try! JSONDecoder().decode(Sliders.self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts,"OK")
            }
        }.resume()
        return retorno
    }
    
    
    func request(endpoint: String, completion: @escaping (Result<Sliders, Error>) -> (Void)){
        guard let url = URL(string: baseUrl) else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        
        
     //   let finalBody = try! JSONSerialization.data(withJSONObject: "")
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
    //    request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        request.setValue("Bearer c80157fdca6715d5903f1b95a9b2fa94f941d7e9", forHTTPHeaderField: "Authorization")

        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.sync {
              
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
              //  print(unwrappedResponse)
                
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
                        
                        if let user = try? JSONDecoder().decode(Sliders.self, from: unwrappedData){
                            completion(.success(user))
                 //          print("Entrò a completion .success")
                          //  print(unwrappedData)
                        }else {
                            print(unwrappedData.base64EncodedData());
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            completion(.failure(errorResponse as ErrorResponse))
                   //         print("Entrò a completion failure")
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


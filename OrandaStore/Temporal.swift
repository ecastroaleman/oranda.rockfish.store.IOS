//
//  Temporal.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/29/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

struct Temporal: View {
  var manager = HttpAuth()
    var body: some View {
        
        Button(action: {
      
            manager.checkDetails()
            
        }){
            Text("WS")
        }
        
        
    }
}

struct Temporal_Previews: PreviewProvider {
    static var previews: some View {
        Temporal()
    }
}

struct Respuesta : Decodable {
    let CodMensaje : String
    let Mensaje : String
    let Datos : newDatos
    
    struct newDatos : Decodable {
        let user_id : Int
    }
}

class HttpAuth : ObservableObject {
    var didChange = PassthroughSubject<HttpAuth, Never>()
    
    var authenticated = false {
        didSet {
            didChange.send(self)
        }
    }
    
    func checkDetails() {
        guard let url = URL(string: "http://35.193.6.214/oauth3/nuevoUsuario.php") else {return}
        
        let body: [String: String] = ["id_gender" : "1",
                                      "firstname" : "ecastro",
                                      "lastname" : "aleman",
                                      "birthday" : "1980-01-01",
                                      "passwd" : "asdff",
                                      "email" : "paunhdp@gmail.com",
                                      "newsletter" : "1",
                                      "optin" : "1"]
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request){(data,response,error) in
            guard let data = data else {return}
            
            let finalData = try! JSONDecoder().decode(Respuesta.self, from: data)
            print(finalData.Mensaje)
            
        }.resume()
    }
}

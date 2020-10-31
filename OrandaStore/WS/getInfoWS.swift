//
//  getInfoWS.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/24/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Foundation

class getInfoWS {
    var tipo : String
    var urlBase = "http://localhost/oauth3/"
    var baseUrl = ""
    
    init(tipo: String){
        self.tipo = tipo
        
        switch tipo {
        case "Slides":
            self.baseUrl = "\(urlBase)getSlides.php/"
        case "ProductoDestacado":
            self.baseUrl = "\(urlBase)getProductoDestacado.php/"
        case "Login":
            self.baseUrl = "\(urlBase)token.php/"
        default:
            self.baseUrl  = "\(urlBase)ERROR"
        }
        
        
    }
    
  /*
    func peticion<T: Codable> (with request: URLRequest, completion: @escaping ()-> (Void)){
        
        let dataTask = URLSession.shared.dataTask(with: request){(data, response, error) in
            
            guard error == nil
            else { completion(.failure(.serverError)); return }
            
            do{
                guard let data = data
                else { completion(.failure(.serverError)); return }
                
                let object = try JSONDecoder().decode(T.self, from: data)
                completion(.success(object))
                
            }catch{
                completion(Result.failure(.parsingError))
            }
        }
        dataTask.resume()
    }*/
  
    
    func getBanners(completion: @escaping (Sliders,String)-> (Void)) {
        var retorno : String = "ERROR"
        
        guard let url = URL(string: self.baseUrl) else {
          retorno = "La URL es invalida..."
            DispatchQueue.main.async { completion(productDataEnc, retorno)}
            return
        }
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
     //   request.setValue("Bearer \(endpoint)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request){ data, response, error in
          
            
            
        //    if error != nil {
             //ini
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    retorno = "No hay respuesta del Servicio"
                    DispatchQueue.main.async { completion(productDataEnc, retorno)}
                    return
                }
              //  print(unwrappedResponse)
                
                switch unwrappedResponse.statusCode {
                case 200 ..< 300:
                    print("Exito \(unwrappedResponse.statusCode)")
                    print(data as Any)
                default:
                    retorno = "Sesion Vencida del Usuario, vuelva a logearse"
                        print("Fallo ERROR \(unwrappedResponse.statusCode)")
                    DispatchQueue.main.async { completion(productDataEnc, retorno) }
                 //   return
                }
                
                if let unwrappedData = data {
                   
                     //   print(unwrappedData)
                        if    let posts = try? JSONDecoder().decode(Sliders.self, from: unwrappedData){
                            retorno = "OK"
                            DispatchQueue.main.async {
                                completion(posts,retorno)
                            }
                        }
                        else {
                            let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data!)
                            retorno = "ERROR"
                            print("Error -> \(errorResponse?.error_description ?? "Token Invalido Banners")")
                            DispatchQueue.main.async {   completion(productDataEnc, retorno) }
                           
                        }
                    
                }
                
                //fin
    /*        }else { retorno = "Error Interno en la comunicacion..."
                DispatchQueue.main.async { completion(productDataEnc, retorno)}
                return
            }*/
            
            
        }.resume()
       
    }
    
    func getProductoDestacado(completion: @escaping (PDestacado,String)-> (Void)) {
        var retorno : String = "ERROR"
        print("Url a utilizar -> \(self.baseUrl)")
        guard let url = URL(string: self.baseUrl) else {
          retorno = "La URL es invalida..."
            DispatchQueue.main.async { completion(productDes, retorno)}
            return
        }
        var request = URLRequest(url: url)
        
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
     //   request.setValue("Bearer \(endpoint)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request){ data, response, error in
          
           // print("Error.localizedDescription \(error?.localizedDescription)")
            
       //     if error!.localizedDescription != nil {
             //ini
        //        print("Entro al Errror != nil")
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    retorno = "No hay respuesta del Servicio"
                    DispatchQueue.main.async { completion(productDes, retorno)}
                    return
                }
              //  print(unwrappedResponse)
                
                switch unwrappedResponse.statusCode {
                case 200 ..< 300:
                    print("Exito \(unwrappedResponse.statusCode)")
                    print(data as Any)
                default:
                    retorno = "Sesion Vencida del Usuario, vuelva a logearse"
                        print("Fallo ERROR \(unwrappedResponse.statusCode)")
                    DispatchQueue.main.async { completion(productDes, retorno) }
                 //   return
                }
                
                if let unwrappedData = data {
                   
                     //   print(unwrappedData)
                        if    let posts = try? JSONDecoder().decode(PDestacado.self, from: unwrappedData){
                            retorno = "OK"
                            print("Dato pd -> \(posts.Datos[0].name)")
                            DispatchQueue.main.async {
                                completion(posts,retorno)
                            }
                        }
                        else {
                            let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data!)
                            retorno = "ERROR"
                            print("Error -> \(errorResponse?.error_description ?? "Token InvalidoPD")")
                            DispatchQueue.main.async {   completion(productDes, retorno) }
                           
                        }
                    
                }
                
                //fin
    /*        }else { retorno = "Error Interno en la comunicacion..."
                print("Entro al ELSE Errror != nil")
                DispatchQueue.main.async { completion(productDes, retorno)}
                return
            }
            */
            
        }.resume()
       
    }
    
    /*
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
    */
    


    func getMenu(pusuario : String, pclave: String, completion: @escaping (UserLogeado,String)-> (Void)) {
    var retorno : String = "ERROR"
    print("Url a utilizar -> \(self.baseUrl)")
    guard let url = URL(string: self.baseUrl) else {
      retorno = "La URL es invalida..."
        DispatchQueue.main.async { completion(tmpUserData, retorno)}
        return
    }
    var request = URLRequest(url: url)
        var components = URLComponents()
        var queryItems = [URLQueryItem]()
        
     //   for (key, value) in parameters {
      //      let queryItem = URLQueryItem(name: key, value: String(describing: value))
       //     queryItems.append(queryItem)
       // }
        
        let queryItem = URLQueryItem(name: "grant_type", value: String(describing: "client_credentials"))
             queryItems.append(queryItem)
        
        components.queryItems = queryItems
        let queryItemData  = components.query?.data(using: .utf8)
        request.httpBody = queryItemData
    
    request.httpMethod = "POST"
   // request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let loginString = String(format: "%@:%@", pusuario, pclave)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

 //   request.setValue("Bearer \(endpoint)", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request){ data, response, error in
      
       // print("Error.localizedDescription \(error?.localizedDescription)")
        
   //     if error!.localizedDescription != nil {
         //ini
    //        print("Entro al Errror != nil")
            guard let unwrappedResponse = response as? HTTPURLResponse else {
                retorno = "No hay respuesta del Servicio"
                DispatchQueue.main.async { completion(tmpUserData, retorno)}
                return
            }
          //  print(unwrappedResponse)
            
            switch unwrappedResponse.statusCode {
            case 200 ..< 300:
                print("Exito \(unwrappedResponse.statusCode)")
                print(data as Any)
            default:
                retorno = "Sesion Vencida del Usuario, vuelva a logearse"
                    print("Fallo ERROR \(unwrappedResponse.statusCode)")
                DispatchQueue.main.async { completion(tmpUserData, retorno) }
             //   return
            }
            
            if let unwrappedData = data {
               
                 //   print(unwrappedData)
                    if    let posts = try? JSONDecoder().decode(UserLogeado.self, from: unwrappedData){
                        retorno = "OK"
                    //    print("Dato pd -> \(posts.Datos[0].name)")
                        DispatchQueue.main.async {
                            completion(posts,retorno)
                        }
                    }
                    else {
                        let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data!)
                        retorno = "ERROR"
                        print("Error -> \(errorResponse?.error_description ?? "Token Invalido MENU")")
                        DispatchQueue.main.async {   completion(tmpUserData, retorno) }
                       
                    }
                
            }
            

        
    }.resume()
   
}

}

enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}

protocol protInfoWS {
    func randomFact(completion: @escaping((Result<Sliders, APIError>) -> (Void)))
}

let productDdesDet = [
    PDDatosDet(id_product_attribute: "0", name: "Test", price: "0.0000", quantity: "0")
]


let productDdesInfo = [
    PDDatosEnc(id_product: "0", name: "Test", price: "0.0000", reference: "", condition: "", Atributos: "", imagen: "", DetalleAtributos: productDdesDet)
  
]

let productDes =
    PDestacado(resultado: "ERROR", Datos: productDdesInfo)
   // PDestacado(resultado: "ERROR")

let productDataInfo = [
    SlidersInfo(id: "1", title: "Peces y Mas ", url_image: "https://oranda.rockfish.store/modules/ps_imageslider/images/392af95f9200e8b8a8d9a12b9198c28bdd98afc4_slider1.jpg")
]

let productDataEnc =
    Sliders(Slides: productDataInfo)

let tmpUserData = UserLogeado(access_token: "", expires_in: 0, token_type: "", scope: "", id_customer: "", name: "", firstname: "", lastname: "", birthday: "", Direcciones: [tmpDirecciones], Pedidos: [tmpPedidos], Menu: tmpMenu)

let tmpDirecciones = Direcciones(alias: "", iso_code: "", address1: "", address2: "", postcode: "", city: "", other: "", phone: "", phone_mobile: "", vat_number: "")

let tmpPedidos = Pedidos(id_order: "", reference: "", name: "", date_add: "", payment: "", entrega: "", dir_entrega: "", dir_entrega2: "", facturacion: "", dir_facturacion: "", dir_facturacion2: "", symbol: "", total_paid: "", invoice_number: "")

let tmpMenu = UserMenu(id_category: "", name: "", SubMenu: [tmpSubMenu])

let tmpSubMenu = UsrSubMenu(id_category: "", name: "")

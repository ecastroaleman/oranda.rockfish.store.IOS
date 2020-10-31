//
//  UserDataList.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/30/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation

//
//  ProductList.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/24/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

final class UserDataList : ObservableObject{
    
    init(){
       
        fetchUserDataList()
    }
    
  @Published var postsPD = [UserLogeado]() {
        didSet {
            didChange.send(self)
        }
    }
 @Published var mensajeRespPD = "ERRORINIT" {
    didSet {
        didChange.send(self)
    }
}
    public func fetchUserDataList(){
        getInfoWS(tipo: "ProductoDestacado").getMenu(pusuario: "emilio.castro.aleman@ericsson.com", pclave: "abcd1234"){retPD, resPD in
         //   print("Si trae dato PD -> \(retPD.Datos[0].name)")
            print("Mensaje dato PD es ->\(resPD)")
            self.postsPD = [retPD]
            self.mensajeRespPD = resPD
            return
        }
        
     
    }
    
   
     
    let didChange = PassthroughSubject<UserDataList, Never>()
}

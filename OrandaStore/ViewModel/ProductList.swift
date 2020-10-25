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

final class ProductList : ObservableObject{
    
    init(){
       
        fetchPostsPD()
    }
    
  @Published var postsPD = [PDestacado]() {
        didSet {
            didChange.send(self)
        }
    }
 @Published var mensajeRespPD = "ERRORINIT" {
    didSet {
        didChange.send(self)
    }
}
    public func fetchPostsPD(){
        getInfoWS(tipo: "ProductoDestacado").getProductoDestacado{retPD, resPD in
         //   print("Si trae dato PD -> \(retPD.Datos[0].name)")
            print("Mensaje dato PD es ->\(resPD)")
            self.postsPD = [retPD]
            self.mensajeRespPD = resPD
            return
        }
        
     
    }
    
   
     
    let didChange = PassthroughSubject<ProductList, Never>()
}

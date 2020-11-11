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
    @EnvironmentObject var general : GlobalInfo
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
       // print("info general.menu.name -> \(general.menu.name)")
       // self.postsPD = [general.info]
        self.mensajeRespPD = "Seteado Manual"
        return
        /*
        getInfoWS(tipo: "ProductoDestacado").getMenu(pusuario: "emilio.castro.aleman@ericsson.com", pclave: "abcd1234"){retPD, resPD in
         //   print("Si trae dato PD -> \(retPD.Datos[0].name)")
            print("Mensaje dato PD es ->\(resPD)")
            self.postsPD = [retPD]
            self.mensajeRespPD = resPD
            return
        }*/
        
     
    }
    
   
     
    let didChange = PassthroughSubject<UserDataList, Never>()
}

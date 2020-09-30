//
//  nUsuarioResponse.swift
//  OrandaStore
//
//  Created by Emilio Castro on 9/28/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation

struct nUserResponse: Decodable {
    let CodMensaje: String
    let Mensaje: String
    let Datos: nUserData
   

    struct nUserData: Decodable {
        let user_id: Int
    /*    let username: String
        let activo: String
        let nacimiento : String
        let genero: String*/
    
}
}

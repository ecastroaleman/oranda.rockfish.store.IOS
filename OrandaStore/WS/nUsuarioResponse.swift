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


//Estructura para los Banner de Inicio
struct Sliders: Codable{
    var Slides: [SlidersInfo]
}
struct SlidersInfo: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var url_image: String
}

//Estructura para los productos Destacados

struct PDestacado: Codable{
    var resultado: String
    var Datos: [PDDatosEnc]
}

struct PDDatosEnc: Codable, Hashable {
    var id_product: String
    var name: String
    var price: String
    var reference: String
    var condition: String
    var Atributos: String
    var imagen: String
    var DetalleAtributos: [PDDatosDet]?
}

struct PDDatosDet: Codable, Hashable {
    var id_product_attribute: String
    var name: String
    var price: String
    var quantity: String
}

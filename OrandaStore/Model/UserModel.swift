//
//  UserModel.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/30/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import Foundation


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
//Structura para Usuario en Login

struct UserLogeado: Codable, Hashable {
    var access_token : String
    var expires_in : Int
    var token_type : String
    var scope : String
    var id_customer : String
    var name : String
    var firstname : String
    var lastname : String
    var birthday : String
    var Direcciones : [Direcciones]?
    var Pedidos : [Pedidos]?
    var Menu : UserMenu
}

struct UserMenu : Codable, Hashable {
    var id_category : String
    var name : String
    var SubMenu : [UsrSubMenu]?
    
}

struct UsrSubMenu: Codable, Hashable {
    var id_category : String
    var name : String
    var SubMenu : [UsrSubSubMenu]?
}

struct UsrSubSubMenu: Codable, Hashable {
    var id_category : String
    var name : String
}

struct Direcciones: Codable, Hashable {
    var alias : String
    var iso_code : String
    var address1 : String
    var address2 : String
    var postcode : String
    var city : String
    var other : String
    var phone : String
    var phone_mobile : String
    var vat_number : String
}

struct Pedidos: Codable, Hashable {
    var id_order : String
    var reference : String
    var name : String
    var date_add : String
    var payment : String
    var entrega : String
    var dir_entrega : String
    var dir_entrega2 : String
    var facturacion : String
    var dir_facturacion : String
    var dir_facturacion2 : String
    var symbol : String
    var total_paid : String
    var invoice_number : String
}



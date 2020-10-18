//
//  ProductModel.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/11/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
struct ProductModel: Identifiable {
    var id : Int
    var title: String
    var image: String
    var precio: String
    var descripcion : String
    
}

let productos = [
    ProductModel(id: 1, title: "Alimento en Hojuela", image: "https://oranda.rockfish.store/img/p/2/7/27.jpg",precio: "Q. 25.00", descripcion: "Descipcion1"),
    ProductModel(id: 2, title: "Filtros Boyu", image: "https://oranda.rockfish.store/img/p/2/9/29.jpg", precio: "Q. 125.00", descripcion: "Descipcion2"),
    ProductModel(id: 3, title: "Escalares", image: "https://oranda.rockfish.store/img/p/3/0/30.jpg", precio: "Q. 45.00", descripcion: "Descipcion3"),
]

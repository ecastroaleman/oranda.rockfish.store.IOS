//
//  Item.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/2/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI

struct Item : Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
    var price : String
    var color : Color
    var detail : String
}


var items : [Item] = [
    Item(image: "black", title: "Angel Black", price: "Q 55.00", color: Color("bg"), detail: "Lindos peces Escalares totalmente color negro")
    ,
    Item(image: "alimento", title: "RedCap", price: "Q 55.00", color: Color("bg"), detail: "Lindos peces RedCap, con brillantes colores")

]



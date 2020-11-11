//
//  GlobalInfo.swift
//  OrandaStore
//
//  Created by Emilio Castro on 10/20/20.
//  Copyright © 2020 Emilio Castro. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class GlobalInfo : ObservableObject {
    @Published var token = ""
    @Published var nombres = ""
    @Published var apellidos = ""
    @Published var id_customer = 0
    @Published var email = ""
    @Published var dir = Direcciones(alias: "", iso_code: "", address1: "", address2: "", postcode: "", city: "", other: "", phone: "", phone_mobile: "", vat_number: "")
    @Published var ped = [Pedidos(id_order: "", reference: "", name: "", date_add: "", payment: "", entrega: "", dir_entrega: "", dir_entrega2: "", facturacion: "", dir_facturacion: "", dir_facturacion2: "", symbol: "", total_paid: "", invoice_number: "")]
    @Published var menu = UserMenu(id_category: "", name: "",
                                   SubMenu: [UsrSubMenu(id_category: "", name: "", SubMenu: [UsrSubSubMenu(id_category: "", name: "")])])
    @Published var info = UserLogeado(access_token: "", expires_in: 1, token_type: "", scope: "", id_customer: "", name: "", firstname: "", lastname: "", birthday: "",
                                      Direcciones: [Direcciones(alias: "", iso_code: "", address1: "", address2: "", postcode: "", city: "", other: "", phone: "", phone_mobile: "", vat_number: "")], Pedidos: [Pedidos(id_order: "", reference: "", name: "", date_add: "", payment: "", entrega: "", dir_entrega: "", dir_entrega2: "", facturacion: "", dir_facturacion: "", dir_facturacion2: "", symbol: "", total_paid: "", invoice_number: "")], Menu: UserMenu(id_category: "", name: "",
                                                                                  SubMenu: [UsrSubMenu(id_category: "", name: "", SubMenu: [UsrSubSubMenu(id_category: "", name: "")])]))
    
    @Published var postsPD = [GlobalInfo]() {
          didSet {
              didChange.send(self)
          }
      }
    init(){
        fetchUserDataList()
    }
    
    public func fetchUserDataList(){
        self.postsPD = [GlobalInfo]()
        return
    }
    
    let didChange = PassthroughSubject<GlobalInfo, Never>()
}
